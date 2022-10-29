import { IsDate, IsDateString, IsString } from "class-validator";

export class CreateEventDto {

  @IsDateString()
  startDate: Date;
  
  @IsDateString()
  endDate: Date;
  
  @IsString()
  title: string;

}