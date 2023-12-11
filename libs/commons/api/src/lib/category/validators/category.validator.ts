import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Not, Raw, Repository } from 'typeorm';
import { CreateCategoryDto } from '../dto/create-category.dto';
import { UpdateCategoryDto } from '../dto/update-category.dto';
import { CategoryEntity } from '../entities/category.entity';

@Injectable()
export class CategoryValidator {

    constructor(@InjectRepository(CategoryEntity) private readonly categoryRepository: Repository<CategoryEntity>) { }

    public async categoryExist(id: string): Promise<boolean> {
        const category = await this.categoryRepository.findOne({ where: { id } });
        return !!category;
    }

    public async nameInUse(name: string): Promise<boolean> {
        const category = await this.categoryRepository.findOne({ where: { name: Raw(alias => `LOWER(${alias}) = '${name.toLowerCase()}'`) } });
        return !!category;
    }

    public async nameInUseAndNotMe(name: string, id: string): Promise<boolean> {
        const category = await this.categoryRepository.findOne({
            where: {
                name: Raw(alias => `LOWER(${alias}) = '${name.toLowerCase()}'`),
                id: Not(id)
            }
        });
        return !!category;
    }

    public async validateExistById(id: string): Promise<boolean> {
        if (!(await this.categoryExist(id))) {
            throw new NotFoundException(`category with id "${id}" not found`);
        }
        return true;
    }

    public async validateExistByName(name: string): Promise<boolean> {
        if (!(await this.nameInUse(name))) {
            throw new NotFoundException(`category with name "${name}" not found`);
        }
        return true;
    }

    public async validateRequired(createCategoryDto: CreateCategoryDto): Promise<boolean> {
        if (!createCategoryDto.name) {
            throw new BadRequestException('names must not be empty');
        }

        return true;
    }

    public async validateCreateCategory(createCategoryDto: CreateCategoryDto): Promise<boolean> {
        const { name } = createCategoryDto;
        if (await this.nameInUse(name)) {
            throw new BadRequestException(`category with name "${name}" already exist`)
        }

        return await this.validateRequired(createCategoryDto);
    }

    public async validateUpdateCategory(_id: string, updateCategoryDto: UpdateCategoryDto): Promise<boolean> {
        const { id, name } = updateCategoryDto;
        if ((id || _id) && (id !== _id)) {
            throw new BadRequestException('id mismatch');
        }

        if (name && (await this.nameInUseAndNotMe(name, id))) {
            throw new BadRequestException(`category with name: "${name}" already exist`);
        }

        return await this.validateExistById(id);
    }
}
