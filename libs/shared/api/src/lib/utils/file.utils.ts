import * as fs from 'fs';
import { Express } from 'express';
import { Multer } from 'multer';

export class FileUtils {
    public static copyAndDelete(file: Express.Multer.File, destinationDirectoryPath: string) {
        const path = `${destinationDirectoryPath}/${file.originalname.replace(/\s+/g, '')}`;
        fs.cpSync(file.path, path);
        fs.rmSync(file.path);
        return path;
    }
}
