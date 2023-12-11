import { Category } from "@kaad/commons/ng-common";

export interface CreateMultimediaDto {
    title: string;
    description: string;
    synopsis: string;
    recommended?: boolean;
    tags: string[];
    thumbnailImage?: unknown;
    file?: unknown;
    categories?: Category[];
    categoriesString?: string;
}
