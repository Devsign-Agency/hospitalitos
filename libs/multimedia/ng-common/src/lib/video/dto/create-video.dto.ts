export interface CreateVideoDto {
    name: string;
    tags: string[];
    description: string;
    file: Express.Multer.File
}
