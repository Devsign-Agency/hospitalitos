import { ApiProperty } from "@nestjs/swagger";

export class RefreshResponse {
    accessToken: string;
    refreshToken: string;
}
