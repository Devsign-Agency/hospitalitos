import { JwtGuard } from '@kaad/core/api';
import { Category } from '@kaad/multimedia/ng-common';
import { Page, PageOptions, SearchOptions } from '@kaad/shared/api';
import {
    Controller,
    Get,
    Post,
    Body,
    Patch,
    Param,
    Delete,
    Query,
    UseGuards,
} from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { CategoryService } from './category.service';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';

@ApiTags('Multimedia/Categories')
@Controller('category')
@UseGuards(JwtGuard)
export class CategoryController {
    constructor(private readonly categoryService: CategoryService) {}

    @Get()
    public async getAll(
            @Query() { criteria, ...pageOptions}: SearchOptions): Promise<Page<Category>> {
        return await this.categoryService.findAll(new PageOptions(pageOptions), criteria);
    }

    @Get(':criteria')
    public async findOne(@Param('criteria') criteria: string, @Query('findBy') findBy: string): Promise<Category> {
        if (findBy === 'name') {
            return await this.categoryService.findByName(criteria);
        } else {
            return await this.categoryService.findById(criteria);
        }
    }

    @Post()
    public async create(@Body() dto: CreateCategoryDto): Promise<Category> {
        const newCategory = await this.categoryService.create(dto);
        return newCategory;
    }

    @Patch(':id')
    public async update(@Param('id') id: string, @Body() category: UpdateCategoryDto): Promise<Category> {
        return this.categoryService.update(id, category);
    }

    @Delete(':id')
    public async delete(@Param('id') id: string): Promise<Category> {
        return await this.categoryService.remove(id);
    }
}
