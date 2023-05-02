import { Module } from '@nestjs/common';
import { CategoryService } from './category.service';
import { CategoryController } from './category.controller';
import { CategoryValidator } from './validators/category.validator';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CategoryEntity } from './entities/category.entity';

@Module({
    controllers: [CategoryController],
    providers: [CategoryService, CategoryValidator],
    imports: [
        TypeOrmModule.forFeature([CategoryEntity])
    ],
    exports: [CategoryService]
})
export class CategoryModule {}
