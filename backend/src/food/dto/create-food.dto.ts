import { IsBoolean, IsString } from 'class-validator';

export class CreateFoodDto {
  @IsBoolean()
  isLimitation: boolean;

  @IsBoolean()
  isIntolerance: boolean;

  @IsString()
  description: string;
}
