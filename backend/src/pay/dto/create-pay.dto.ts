import { IsArray, IsString } from 'class-validator';

export class CreatePayDto {
  @IsString()
  title: string;

  @IsArray()
  @IsString({ each: true })
  features: string[];
}
