import { Component, Input, Output, EventEmitter, ChangeDetectionStrategy, OnChanges, SimpleChanges } from '@angular/core';
import { FormArray, FormBuilder, FormControl, Validators } from '@angular/forms';

import { Service } from '@app/health/shared/services/services.service';


@Component({
  selector: 'app-service-form',
  changeDetection: ChangeDetectionStrategy.OnPush,
  templateUrl: './service-form.component.html',
  styleUrls: ['./service-form.component.scss']
})
export class ServiceFormComponent implements OnChanges {

  toggled = false;
  exists = false;

  @Input()
  service: Service;

  @Output()
  create = new EventEmitter<Service>();

  @Output()
  update = new EventEmitter<Service>();

  @Output()
  remove = new EventEmitter<Service>();

  form = this.fb.group({
    name: ['', Validators.required],
    ingredients: this.fb.array(['']),
    alergics:  this.fb.array(['']),
  });

  constructor(
    private fb: FormBuilder
  ) {}

  ngOnChanges(changes: SimpleChanges) {
    if (this.service && this.service.name) {
      this.exists = true;
      this.emptyIngredients();
      this.emptyAlergics();

      const value = this.service;
      this.form.patchValue(value);

      if (value.ingredients) {
        for (const item of value.ingredients) {
          this.ingredients.push(new FormControl(item));
        }
      }

      if (value.alergics) {
        for (const item of value.alergics) {
          this.alergics.push(new FormControl(item));
        }
      }

    }
  }

  emptyIngredients() {
    while (this.ingredients.controls.length) {
      this.ingredients.removeAt(0);
    }
  }

  emptyAlergics() {
    while (this.alergics.controls.length) {
      this.alergics.removeAt(0);
    }
  }

  get required() {
    return (
      this.form.get('name').hasError('required') &&
      this.form.get('name').touched
    );
  }

  get ingredients() {
    return this.form.get('ingredients') as FormArray;
  }

  get alergics() {
    return this.form.get('alergics') as FormArray;
  }

  addIngredient() {
    this.ingredients.push(new FormControl(''));
  }

  removeIngredient(index: number) {
    this.ingredients.removeAt(index);
  }

  addIngredientAlergic() {
    this.alergics.push(new FormControl(''));
  }

  removeIngredientAlergic(index: number) {
    this.alergics.removeAt(index);
  }

  createService() {
    if (this.form.valid) {
      this.create.emit(this.form.value);
    }
  }

  updateService() {
    if (this.form.valid) {
      this.update.emit(this.form.value);
    }
  }

  removeService() {
    this.remove.emit(this.form.value);
  }

  toggle() {
    this.toggled = !this.toggled;
  }

}

