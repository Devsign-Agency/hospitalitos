import { Multimedia } from "../../common/interfaces/multimedia.interface";

export interface Video extends Multimedia {
    code: string;
    url: string;
}
