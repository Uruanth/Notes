# Angular

## Commands

### Generate a new project

 ~~~shell
 ng new <nameApp>
 ~~~

### Generate a module

~~~shell
ng g m <nameModule>
~~~

### Generate a component

~~~shell
ng g c <rute>/<nameComponent>
~~~

## Flags

### Without tests

~~~shell
--skipTests
~~~

### In the same folder

~~~shell
--flat
~~~

### Module with routes

~~~shell
--routing
~~~

### Without style file

~~~she
-is
~~~





## RouterModule

~~~typescript
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { exampleComponent } from '<ruteComponent>';

const routes: Routes = [
    {
        path: '',
        component: <nameComponent>,
        pathMatch: 'full'
	},
  	{
        path: 'path-url',
        component: exampleComponent
	},
  	{
        path: '**',
        redirect: exampleComponent
	}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class WithRoutesRoutingModule { }
~~~

### Add roter module to app module

~~~typescript
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { WithRoutesRoutingModule } from './with-routes-routing.module';


@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    WithRoutesRoutingModule //Add here
  ],
})
export class WithRoutesModule { }
~~~

### Add to component

~~~html
<router-outlet></router-outlet>
~~~



## PIPES

### How to use?

Los pipes solo transforman las variables de manera visual, no alteran el valor de la variable.

Pipes only transform the visual shape of variables, they don't change the value of the variabe.

~~~html
<h1>
    {{ nameVar | namePipe }}
</h1>
~~~

#### GENERIC PIPES

* upperCase
* lowerCase
* titlecase
* number
* json
* date

~~~html
<!-- Formato fecha normal -->
{{ value | date }}
<!-- Formato fecha formato 'short' -->
{{ value | date:'short' }}
<!-- Formato fecha formato 'long' -->
{{ value | date:'long' }}
<!-- Formato fecha solo el mes con dos digitos -->
{{ value | date:'MM' }}
<!-- Formato fecha formato personalizado -->
{{ value | date: 'MM dd, yyyy' }}
~~~



## Modules

### Normal module

~~~typescript
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

@NgModule({
  declarations: [
      AppComponent, 
      NxWelcomeComponent
  ],
  imports: [BrowserModule],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
~~~



### Modules for exporting components only

~~~typescript
import { <nameComponent> } from '<url component>';
import { NxWelcomeComponent } from './nx-welcome.component';

@NgModule({
  exports: [
      AppComponent,
      NxWelcomeComponent
  ]
})
export class ModuleForExportingOnly {}
~~~

