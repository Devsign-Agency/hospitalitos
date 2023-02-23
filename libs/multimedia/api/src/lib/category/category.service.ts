import { Category } from '@kaad/multimedia/ng-common';
import { Page, PageMeta, PageOptions } from '@kaad/shared/api';
import { Order } from '@kaad/shared/ng-common';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { CategoryEntity } from './entities/category.entity';
import { CategoryValidator } from './validators/category.validator';

@Injectable()
export class CategoryService {

    constructor(@InjectRepository(CategoryEntity) private readonly repository: Repository<CategoryEntity>,
                private readonly validator: CategoryValidator) {}

    public async findAll(pageOptions: PageOptions, criteria?: string): Promise<Page<Category>> {
        const queryBuilder = this.repository.createQueryBuilder('category');

        queryBuilder
            .orderBy('category.name', Order.ASC)
            .skip(pageOptions.skip)
            .take(pageOptions.take);

        if (criteria) {
            queryBuilder
                .where('category.name like :criteria', { criteria: `%${criteria}%` });
        }

        const [list, count] = await queryBuilder.getManyAndCount();
        const pageMetaDto = new PageMeta({ itemCount: count, pageOptions });
        return new Page(list, pageMetaDto);
    }

    public async findById(id: string) {
        let category: Category

        if (await this.validator.validateExistById(id)){
            category = await this.repository.findOne({ where: { id } });
        }

        return category
    }

    public async findByName(name: string) {
        let category: Category

        if (await this.validator.validateExistByName(name)){
            category = await this.repository.findOne({ where: { name } });
        }

        return category
    }

    public async create(createCategoryDto: CreateCategoryDto) {
        let category: Category

        if (await this.validator.validateCreateCategory(createCategoryDto)) {
            const toAdd = { name: createCategoryDto.name };
            category = await this.repository.save(toAdd);
        }
        return category;
    }

    public async update(id: string, updateCategoryDto: UpdateCategoryDto) {
        let category: Category;
        if (await this.validator.validateUpdateCategory(id, updateCategoryDto)) {
            const { name } = updateCategoryDto;
            category = await this.findById(id);

            if (name) {
                category.name = name;
            }

            category = await this.repository.save(category);
        }
        return category;
    }

    public async remove(id: string): Promise<Category> {
        let category: CategoryEntity;
        if (await this.validator.validateExistById(id)) {
            category = await this.findById(id);
            await this.repository.remove(category);
        }
        return category;
    }
}
