/* eslint-disable @typescript-eslint/no-unused-vars */
import { Multimedia } from '@kaad/multimedia/ng-common';
import { Page, PageMeta, PageOptions } from '@kaad/shared/api';
import { Order } from '@kaad/shared/ng-common';
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Repository } from 'typeorm';
import { MultimediaEntity } from '../../entities/multimedia.entity';
import { MultimediaValidator } from '../validator/multimedia.validator';

@Injectable()
export class MultimediaService<T extends Multimedia, E extends MultimediaEntity & T> {

    protected entityName: string;
    protected repository: Repository<E>;

    constructor(protected readonly config: ConfigService,
                protected readonly validator: MultimediaValidator<T, E>) {}

    public async findAll(pageOptions: PageOptions, criteria?: string): Promise<Page<E>> {
        const queryBuilder = this.createQueryBuilder(pageOptions, criteria);

        const itemCount = await queryBuilder.getCount();
        const { entities } = await queryBuilder.getRawAndEntities();

        const pageMetaDto = new PageMeta({ itemCount, pageOptions });

        return new Page<E>(entities, pageMetaDto);
    }

    protected createQueryBuilder(pageOptions: PageOptions, criteria?: string) {
        const entity = this.entityName;
        const queryBuilder = this.repository.createQueryBuilder(entity);

        queryBuilder
            .orderBy(`${entity}.createdAt`, Order.DESC)
            .skip(pageOptions.skip)
            .take(pageOptions.take);

        if (criteria) {
            queryBuilder
                .where(`${entity}.title like :criteria`, { criteria: `%${criteria}%` })
                .orWhere(`${entity}.description like :criteria`, { criteria: `%${criteria}%` })
                .orWhere(`${entity}.synopsis like :criteria`, { criteria: `%${criteria}%` })
                .orWhere(`${entity}.tags like :criteria`, { criteria: `%${criteria}%` });
        }

        return queryBuilder;
    }

    async findById(id: string) {
        let item: E;

        if (await this.validator.validateEntityExistById(id)) {
            const entity = this.entityName;
            const queryBuilder = this.repository.createQueryBuilder(entity);

            queryBuilder
                .where(`${entity}.id = :id`, { id })
            item = await queryBuilder.getOne();
        }
        return item;
    }

    protected getCreateDto() {
        return null;
    }

    protected async preCreate(file: Express.Multer.File, thumbnailImage: Express.Multer.File, createMultimediaDto: Partial<T>): Promise<E> {
        return null;
    }

    async create(file: Express.Multer.File, thumbnailImage: Express.Multer.File, createMultimediaDto: Partial<T>): Promise<T> {
        let newEntity: T;

        if (await this.validator.validateRequired(createMultimediaDto)) {
            const entity = await this.preCreate(file, thumbnailImage, createMultimediaDto);
            newEntity = await this.repository.save(entity);
        }

        return newEntity;
    }

    protected async preUpdate(id: string, updateEntityDto: Partial<T>): Promise<E> {
        return null;
    }

    async update(id: string, updateVideoDto: Partial<T>) {
        let entity: E;

        if (await this.validator.validateEntityExistById(id)) {
            entity = await this.preUpdate(id, updateVideoDto);
            entity = await this.repository.save(entity);
        }

        return entity;
    }

    async remove(id: string) {
        let video: E;
        if (await this.validator.validateEntityExistById(id)) {
            video = await this.findById(id);
            await this.repository.remove(video);
        }
        return video;
    }
}
