import { Category, Multimedia } from '@kaad/multimedia/ng-common';
import { BaseEntity } from '@kaad/shared/api';
import { Column, JoinTable, ManyToMany } from 'typeorm';
import { CategoryEntity } from '../../category/entities/category.entity';

export abstract class MultimediaEntity extends BaseEntity implements Multimedia {
    @Column({ nullable: false })
    title: string;

    @Column({ unique: true, nullable: false })
    url: string;

    @Column({ nullable: true })
    description: string;

    @Column({ nullable: true })
    synopsis: string;

    @Column({ nullable: true })
    thumbnail: string;

    @Column({ type: 'boolean', default: false })
    recommended: boolean;

    @Column({ type: 'simple-array', nullable: true })
    tags: string[];

    @ManyToMany(() => CategoryEntity)
    @JoinTable()
    categories: Category[];
}
