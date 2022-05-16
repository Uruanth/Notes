# Readme

## INSTALAR ANGULAR 9.15

~~~shell
npm i -g @angular/cli@9.1.15

#Desinstalar angular
npm uninstall @angular/cli
~~~



## INSTALAR NgRx

~~~shell
npm install @ngrx/store
npm install @ngrx/store-


npm audit fix


ng g c componentes/notest --skipTests=true
~~~

## Effects





## Lazy loading

para crear un nuevo modulo con el archivo de rutas

  ~~~shell
  ng g m nombreModule --routing
  ~~~

## guard

~~~shell
ng g guard nombreGuar
~~~



# Testing

Ejecutar con covertura pero sin quedar ejecutando en segundo plano

~~~shell
ng test --no-watch --code-coverage
~~~

## Declarar variables

Para que una variable pueda ser usada en cada caso lo ideal es declararla despues del describe e inicializarla en algun before

~~~typescript
describe('Variables test', () => {
    variable1: number;
    
    //Aqui antes de cada prueba la variable tendra el valor de 100
    beforeEach(()=>{
        variable1 = 100;
    });
    
});
~~~





## Expects

~~~typescript
expect( ... ).toBe( arg ); //Se espera que sea totalmente igual
expect( ... ).toContain( arg ); //Se espera que sea contenga el arg
expect( ... ).toBeTruthy( arg ); //Se espera que sea verdadero
expect( ... ).not.toBeTruthy( arg ); //Se espera que sea falso
expect( ... ).toBeFalsy( arg ); //Se espera que sea falso
expect( ... ).toBeGreaterThanOrEqual( arg ); //debe ser igual o mayor a arg
expect( spy ).toHaveBeenCalledWith("1"); //El metodo se llamo con tal argumento
~~~

## Pre y post ajustes

~~~typescript
beforeAll(()=>{
    //Aqui van las instrucciones
});

beforeEach(()=>{
        //Aqui van las instrucciones
});

afterAll(()=>{
        //Aqui van las instrucciones
});

afterEach(()=>{
        //Aqui van las instrucciones
});
~~~

## Mockear

~~~typescript
    it('Init: cargar medicos', () => {

        //Mockear el servicio
        //primer argumento es la instancia a mockear
        //El segundo argumento es el metodo a m
        spyOn( servicio, 'getMedicos' )
        .and
        .callFake( () => {
            return from(['medico1', 'medico2', 'medico3']);
        } )

        componente.ngOnInit();
        expect(componente.medicos.length).toBeGreaterThan(0);
   
    });
~~~

## Verificar el llamado de un metodo

~~~typescript
it('Init: verificar llamda de metodo', () => {

        //Mockear el servicio
        const spy = spyOn( servicio, 'agregarMedico' )
        .and
        .callFake( medico => {
            return EMPTY;
        } )

        componente.agregarMedico();

        expect(spy).toHaveBeenCalled();
   
    });
~~~

## De integracion

~~~typescript
import { TestBed, ComponentFixture } from '@angular/core/testing';
import { IncrementadorComponent } from './incrementador.component';
import { FormsModule } from '@angular/forms';
import { By } from '@angular/platform-browser';


describe('Incremendator Component', () => {

    let component: IncrementadorComponent;
    let fixture: ComponentFixture<IncrementadorComponent>;

    beforeEach( () => {
        TestBed.configureTestingModule({
            declarations: [ IncrementadorComponent ],
            imports: [ FormsModule ]
        });

        fixture = TestBed.createComponent(IncrementadorComponent);
        component = fixture.componentInstance;

    });

    it('Probar binding del h3', () => {
        component.leyenda = 'Porgreso carga';

        fixture.detectChanges(); //Detección de cambios

        const elem: HTMLElement = fixture.debugElement
            .query(By.css('h3')).nativeElement;
            expect( elem.innerHTML ).toContain('Porgreso carga');

    });

    it('Debe mostrar el valor del progreso en el input', () => {
        component.cambiarValor(5);
        fixture.detectChanges();
        fixture.whenStable().then( (done: DoneFn)=> {
            const input = fixture.debugElement.query(By.css('input'));
            const elem = input.nativeElement;
            expect( elem.value ).toBe('55');
            
        });
    });


    it('comprobar eventos en los elementos html', () => {

        const btns = fixture.debugElement.queryAll(By.css('.btn-primary'));
        // console.log(btns);
        btns[0].triggerEventHandler('click', null);
        expect(component.progreso).toBe(45);

        btns[1].triggerEventHandler('click', null);
        expect(component.progreso).toBe(50);

    });

    it('comprobar eventos en los elementos html, despues del click', () => {

        const btns = fixture.debugElement.queryAll(By.css('.btn-primary'));
        const elem: HTMLElement = fixture.debugElement.query(By.css('h3')).nativeElement;
        
        btns[0].triggerEventHandler('click', null);

        fixture.detectChanges();
        expect( elem.innerHTML ).toContain('45');
        // fixture.whenStable().then( ()=> {
        // });

     

    });

});

~~~

## Comprobar routerLink

~~~typescript
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { RouterLinkWithHref } from '@angular/router';

import { NavbarComponent } from './navbar.component';
import { RouterTestingModule } from '@angular/router/testing';

describe('NavbarComponent', () => {
  let component: NavbarComponent;
  let fixture: ComponentFixture<NavbarComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NavbarComponent ],
      imports: [ RouterTestingModule ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NavbarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('debe tener un link a la pagina medicos', () => {

    let elementos = fixture.debugElement.queryAll(By.directive(RouterLinkWithHref));

    let existe = false;
    elementos.forEach(elemento => {
      if(elemento.attributes['routerLink'] === '/medicos'){
        existe = true;
      }
    })
    expect(existe).toBeTruthy();
  });

});
~~~



## Simulando servicios

~~~typescript
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { Router, ActivatedRoute } from '@angular/router';

import { RouterMedicoComponent } from './router-medico.component';
import { Observable, EMPTY } from 'rxjs';

//Simular el navigate
class FakeRouter {
  navigate( params ) {}
}

//Simular el activated router
class FakeActivatedRoute {
  params: Observable<any> = EMPTY;
}
describe('RouterMedicoComponent', () => {
  let component: RouterMedicoComponent;
  let fixture: ComponentFixture<RouterMedicoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RouterMedicoComponent ],
      providers: [
        { provide: Router, useClass: FakeRouter },
        { provide: ActivatedRoute, useClass: FakeActivatedRoute },
      ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RouterMedicoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });


  it('debe redireccionar a medico cuando se guarde', () => {
    const router = TestBed.get(Router);
    const spy = spyOn(router, 'navigate');

    component.guardarMedico();

    expect(spy).toHaveBeenCalledWith(['medico','123']);

  });

});

~~~

## test app router

~~~typescript
import { MedicoComponent } from 'src/app/intermedio2/medico/medico.component';
import { RUTAS } from './app.routes';


describe('Rutas principales', () => {

    it('Debe existir la ruta /medico/:id', () => {
        expect( RUTAS ).toContain( {
            path: 'medico/:id', component: MedicoComponent
        })
    });

});
~~~

## FakeObservables

~~~typescript
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { Router, ActivatedRoute } from '@angular/router';

import { RouterMedicoComponent } from './router-medico.component';
import { Observable, EMPTY, Subject } from 'rxjs';

//Simular el navigate
class FakeRouter {
  navigate( params ) {}
}

//Simular el activated router
class FakeActivatedRoute {
  // params: Observable<any> = EMPTY;

  private subject = new Subject();

  push( valor ){
    this.subject.next( valor );
  }

  get params(){
    return this.subject.asObservable();
  }

}
describe('RouterMedicoComponent', () => {
  let component: RouterMedicoComponent;
  let fixture: ComponentFixture<RouterMedicoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RouterMedicoComponent ],
      providers: [
        { provide: Router, useClass: FakeRouter },
        { provide: ActivatedRoute, useClass: FakeActivatedRoute },
      ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RouterMedicoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });


  it('debe redireccionar a medico cuando se guarde', () => {
    const router = TestBed.get(Router);
    const spy = spyOn(router, 'navigate');

    component.guardarMedico();

    expect(spy).toHaveBeenCalledWith(['medico','123']);

  });


  it('debe de colocar el id igual a nuevo', ()=>{
    
    const activatedRoute: FakeActivatedRoute = TestBed.get(ActivatedRoute);
    activatedRoute.push({id: 'nuevo'});

    expect(component.id).toBe('nuevo');

  });

});
~~~

---

# Web bundle Analyzer

## Instalación

~~~shell
npm i webpack-bundle-analyzer --save-dev
~~~

## Uso

1. Generar el build de la app

   ~~~shell
   ng build --prod --stats-json
   ~~~

2. Correr el bundle analyzer

   ~~~shell
   npx webpack-bundle-analyzer dist/[nombreApp]/s
   ~~~

   

---

## NOTAS

~~~shell
#Comprobar que le es util a npm
npm cache verify
~~~

a
