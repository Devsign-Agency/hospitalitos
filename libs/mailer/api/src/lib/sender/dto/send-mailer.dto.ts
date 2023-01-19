import { ApiProperty } from "@nestjs/swagger";

export class SendMailerDto {

    @ApiProperty({ required: false })
    from?: string;

    @ApiProperty({ required: true, default: 'bpena.tester@gmail.com' })
    to: string;

    @ApiProperty({ required: true, default: { message: 'es un texto de prueba' } })
    context: unknown;

    @ApiProperty({ required: true, default: 'Prueba' })
    subject: string;
}
