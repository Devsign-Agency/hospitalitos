import { CreateBookDto } from './create-book.dto';

export interface UpdateBookDto extends Partial<CreateBookDto> {
    id: string;
}
