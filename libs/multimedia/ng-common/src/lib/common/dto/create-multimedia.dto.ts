import { Category } from "../../category";

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
