import { Multimedia } from "../../common/interfaces/multimedia.interface";

export interface Audio extends Multimedia {
    code: string;
    url: string;
}
