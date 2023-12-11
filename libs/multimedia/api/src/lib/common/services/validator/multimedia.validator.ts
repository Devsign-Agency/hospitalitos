import { Multimedia } from '@kaad/multimedia/ng-common';
import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { Like, Repository } from 'typeorm';
import { MultimediaEntity } from '../../entities/multimedia.entity';

@Injectable()
export class MultimediaValidator<T extends Multimedia, E extends MultimediaEntity> {

    protected entityName: string;
    protected repository: Repository<E>;

    public async entityExist(id: string): Promise<boolean> {
        const entity = this.entityName;
        const queryBuilder = this.repository.createQueryBuilder(entity);

        queryBuilder
            .where(`${entity}.id = :id`, { id })
        const item = await queryBuilder.getOne();
        return !!item;
    }

    public async tagExist(tag: string): Promise<boolean> {
        const entity = this.entityName;
        const queryBuilder = this.repository.createQueryBuilder(entity);

        queryBuilder
            .where(`${entity}.tags = :tags`, { tags: Like(`%${tag}%`) })

        const item = await queryBuilder.getOne();
        return !!item;
    }

    public async validateEntityExistById(id: string): Promise<boolean> {
        if (!(await this.entityExist(id))) {
            throw new NotFoundException(`entity with id "${id}" not found`);
        }

        return true;
    }

    public async validateRequired(entity: Partial<T>): Promise<boolean> {
        if (!entity.title) {
            throw new BadRequestException("title must not be empty");
        }

        if (!entity.tags || entity.tags.length === 0) {
            throw new BadRequestException("tags must not be empty");
        }

        return true;
    }
}
