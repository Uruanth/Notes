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
--skipTests  || --skip-tests
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

~~~shell
--inline-style || -is || -s
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
        redirect: 'path-url'
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

### GENERIC PIPES

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

#### Cambiar idioma por defecto de  los pipes

#### Change the default language of pipes

En el app module:	|| In the app module:

~~~typescript

import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CompWithoutTestComponent } from './comp-without-test/comp-without-test.component';
import { WithoutStyleComponent } from './without-style/without-style.component';

//change language
//XX es el pais del lenguaje || is country of language 
import { LOCALE_ID, NgModule } from '@angular/core';
import localeEs from '@angular/common/locales/es-XX';
import localeFr from '@angular/common/locales/fr';
import { registerLocaleData } from '@angular/common';

registerLocaleData( localeEs );
registerLocaleData( localeFr );

@NgModule({
  declarations: [
    AppComponent,
    CompWithoutTestComponent,
    WithoutStyleComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
   //Cambiar de manera global || overall shape global
  providers: [{
      provide: LOCALE_ID,
      useValue: 'es-XX'
  }],
  bootstrap: [AppComponent]
})
export class AppModule { }

~~~

En el pipe || In the pipe 

~~~html
<!-- Formato fecha idioma ingles -->
{{ value | date: 'MM dd, yyyy':'':'en' }}
<!-- Formato fecha idioma frances, esto funciona porque se importo y se registro en el app moduel -->
{{ value | date: 'MM dd, yyyy':'':'fr' }}
~~~

* Decimal

  ~~~html
  <!-- Formato decimal -->
  <!-- 1 entero y los decimales en un rango de 2 a 2 (cantidad de decimales no valor de este) -->
  {{ value | number:'1.2-2'  }}
  ~~~

* Currency

  ~~~html
  <!-- Formato moneda -->
  <!-- tipo moneda - tipo simbolo - cantidad de enteros y decimales -->
  {{ value | currency:'COP':'symbol-narrow':'1.0-4'  }}
  ~~~

* Percent

  ~~~html
  <!-- Formato moneda -->
  <!--  cantidad de enteros y decimales -->
  {{ value | percent:'2.2-2' }}
  ~~~

* i18nSelect:

  Dependiendo del genero que tenga la variable, sera la opción mostrada, el argumento de mapeado es obligatorio.

  ~~~html
  <!-- Formato i18nSelect -->
  {{ genero | i18nSelect:mapeado }}
  ~~~

  **component**

  ~~~typescript
  nombre: string = 'asdadasd';
  genero: string = 'femenino';
  
  mapeado = {
      'femenino': 'opcion 1',
      'masculino': 'opcion 2'
  }
  ~~~

* i18nPlural

  Dependiendo de la respuesta de clientes.length va usar una de las opciones del mapeado, el other es cualquier otra opcion posible, y si dentro de la cadena se usa el #, muestra el valor que recibe el pipe, en este caso el valor que tenga clientes.length

  ~~~html
  <!-- Formato i18nPlural -->
  {{ clientes.length | i18nPlural:mapeado }}
  ~~~

  **component**

  ~~~typescript
  clientes: string[] = ['Maria', 'Juan', 'Pedro'];
  
  mapeado = {
      '=0': 'opcion 1',
      '=1': 'opcion 2',
      'other': 'opcion 4 #'
  }
  
  ~~~

* slice

  ~~~html
  <!-- toma los valores desde 0 a 2 del arreglo, si solo se deja el primer atributo es desde donde empieza y toma el resto del arreglo, el segundo argumento es el indice hasta cual debe llegar pero no lo incluye -->
  {{ clientes | slice:0:2 }}
  ~~~

* KeyValue

  ~~~html
   
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

