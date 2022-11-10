import { IsDate, IsDateString, IsIn, IsString, IsInt, IsOptional } from "class-validator";

export class CreateEventDto {

  @IsDateString()
  startDate: Date;
  
  @IsDateString()
  endDate: Date;
  
  @IsString()
  title: string;

  @IsIn(['training','group','appointment','free'])
  type: string;

  @IsInt()
  @IsOptional()
  duration: number = 0;

  @IsInt()
  @IsOptional()
  distance: number = 0;

}