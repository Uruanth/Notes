# 	React JS

Primero se instala node Js.

Para crear un proyecto, en el cmd se ingresa la linea, no se puede usar mayusculas en el nombre del proyecto

~~~powershell
npx create-react-app nombre-de-la-app
~~~

Ubicado en la carpeta de la app se ejecuta, para correr la app, la ejecuta en el port 3000 por defecto 

~~~powershell
npm run start
~~~

## Componentes

Los componentes se importan y usan como etiquetas html en el archivo app.js 

En la const el nombre de estado es una variable y el segundo una funcion, la practica es que la funcion modifique a la variable, dentro del useState es el valor inicial de la variable.

Para devolver mas de un componente tienen que estar dentro de un div o importar Fragment, el fragment no se pinta en el html de la vista.

Para cambiar el valor del estado se invoca dentro de su setter

~~~js
import React, {useState, Fragment} from 'react';

const nombreComponente = () => {
    
    const nombreFuncion = () =>{
	    console.log("instrucciones de una funcion ");
        setNombreEstado(nombreEstado + 1);
    };
    
    
    const [nombreEstado, setNombreEstado] = useState("valor");
    return (
        <Fragment>
	    	<h1> codigo html a retornar {nombreEstado}</h1>
			<buttom onClic={}>Nombre boton</button>
        </Fragment>
        
    );
}

export default nombreComponente;
~~~

Se puede usar logica js dentro del retorno, en el ejemplo vemos usado un if en una sola linea

  ~~~js
  import React, {useState, Fragment} from 'react';
  
  const nombreComponente = () => {
      
      const nombreVariable = 20;
      return (
          <Fragment>
  	    	<p>
                  {
                      nombrevariable > 15 ? "si es verdadera la condicion" : "si es falsa"
                  }
          	</p>
          </Fragment>
          
      );
  }
  
  export default nombreComponente;
  ~~~

### Arreglos

Para recorrer arreglos.

~~~js
import React, {useState, Fragment} from 'react';

const nombreComponente = () => {
       
    const [nombreEstado, setNombreEstado] = useState([]); //Iniciar un array vacio
    return (
        <Fragment>
	    	<h2>Recorriendo arreglo</h2>
        	{
        		nombreEstado.map((item, index)=>{
        			return <p key={index}> {item} - {index} </p>
    			});
       		}
        </Fragment>
        
    );
}

export default nombreComponente;
~~~

Para agregar elementos no se usa el método push en el setEstado, sino la concatenación así:

~~~js
setEstado([...arreglo, nuevoValor]);
~~~

### Formularios

Las clases se ponen dentro de las etiquetas pero con el nombre de porpiedad de className="".

Para relacionar las entradas como regla con el atributo name se asigna igual que el nombre de la variable que va a almacenar el valor

~~~javascript
import React, {useState, Fragment} from 'react';

const nombreComponente = () => {
       
    const [nombreEstado, setNombreEstado] = useState({
        var1: "",
        var2: ""
    }); //Iniciar un objeto
    
    //recibe el evento del input
    const nombreFuncion = (e) => {
        setNombreEstado({
          ...nombreEstado, 
          [e.target.name ]: e.target.value 
      })  
        
    };
    
    const enviarDatos = (event) => {
        event.preventDefault(); //Para evitar que el formulario se ejecute por default
    };
    
    
    return (
        <Fragment>
	    	<h2 className="nombreClase">Recorriendo arreglo</h2>
        	//Diseño del fomularios
        	<form onSubmit={enviarDatos}>
                <input 
        		name="var1"
        		onChange={nombreFuncion}/>
                <button type="submit"></button>
	        </form>
        	      	
        </Fragment>
        
    );
}

export default nombreComponente;
~~~

### React Hook Form

Primero se debe instalar una libreria, en la capeta del proyecto se abre una consola y se ingresa el comando:

~~~powershell
npm install react-hook-form
~~~

Los input deben tener el atributo name definido.

{errors?.var1?.message}, si existe un error, comprueba la var1 y si esta tiene error manda el valor del message defenido antes.

El setValue es opcional, se usa para definir valores en las etiquetas que tengan el atributo name igual y el segundo valor es es el que se le va a asignar como valor a esa etiqueta.

~~~javascript
import React, {useState, Fragment} from 'react';
import {useForm} from 'react-hook-form'

const nombreComponente = () => {
       
    
    const onSubmit = (data, event) => {
        instrucciones;
        
        event.target.reset(); //Limpiar el campo del input
    }
    const {register, errors, handleSubmit, setValue} = useForm(
        default: variable; //Los atributos de la variable que tengan el mismo nombre que el atributo de la etiqueta name se mostran al inicio como valores por defecto 
    
    );
    
    setValue('nombreAtributo', valor)
    return (
        <Fragment>
	    	<h2 className="nombreClase">Recorriendo arreglo</h2>
        	//Diseño del fomularios
        	<form onSubmit={handleSubmit(onSumit)}>
                <input 
        		name="var1"
        		nameClass="clases bootstrap"
				ref={
                    registrer({
                        required: {value: true, message: 'mensaje de error'},
                        minlength: {value: 2, message: "asdasasd"} //longitud minima
                    })
                 }
				/>
                 <span>
                    {errors?.var1?.message}
                 </span>
				{ errors.var1 && //si esto es diferente de undefined se renderiza lo que esta adelante	
    			<span>
                    {errors?.var1?.message}
                 </span>
				}
                <button type="submit">nameClass="clases bootstrap" </button>
	        </form>
        	      	
        </Fragment>
        
    );
}

export default nombreComponente;
~~~

### PROPS

Mandar valores como atributo en etiquetas de los componentes, siempre lo toma como cadena a menos que se ponga la variable entre { }, entre las llaves se pueden enviar todo tipo de variables

Se usa el argumento props se usa para recibir los atributos de un componente padre.

Los props siempre son variables de lectura, por lo tanto para modificarlos en el componente es necesario instanciarlos en otra variable.

~~~javascript
//---------------------------------------Componente padre--------------------------------------------------
import React, {useState, Fragment} from 'react';
import {useForm} from 'react-hook-form'

const nombrePadre = () => {
       
   
    return (
       <nombreComponente atributo="valor"/>
        <nombreComponente atributo={otrovalor}/>
        
    );
}

export default nombrePadre;


//---------------------------------------Componente hijo---------------------------------------------------
import React, {useState, Fragment} from 'react';
import {useForm} from 'react-hook-form'

const nombreComponente = (props) => {
//const nombreComponente = ({nombreAtibuto}) => { asi se puede recibir atributos especificos
       
    
   
    return (
        <Fragment>
	    	<h1>Saludar {props.atributo}</h1>
        </Fragment>
        
    );
}

export default nombreComponente;
~~~

Guardar variables con propiedades de los props en una sola linea

~~~jsx
 const { propiedad1, propiedad2 } = props; //saca los valores de los atributos de props que se llamen igual
~~~



### CRUD

### Rutas

Instalar 

~~~powershell
npm install react-router-dom
~~~



### useEffect



# Notas

Manejador de paquetes

~~~powershell
npm install --global yarn
~~~

### Filter

Regresa solo los elementos que no tiene la variable

~~~javascript
const nombreVariable= array.filter(arr => arr.atributo !== variable);
~~~

Se importa

~~~javascript
import React, {useState, Fragment} from 'react';
import {useForm} from 'react-hook-form'
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link,
  NavLink
} from "react-router-dom";	


const nombreComponente = (props) => {
  
   return (
	<Router>
    <Switch>   
       <Link to="/ruta">
	       navbar
       </Link>
        <NavLink to="/ruta" activeClassName="active">
	       navbar
       </NavLink>
       <Route path="/" exact> //Ruta raiz
       
       </Route>
       <Route path="/ruta">
       
       </Route>
       <Route path="/ruta" >
       
       </Route>
       <Route path="/ruta/:id" >
       
       </Route>
    </Switch>
    </Router>        
    );
}

export default nombreComponente;
~~~

Los componentes que esten dentro del route solo son los que se renderizan cuando se escribe esa ruta, la ruta raiz se configura con "/".

La ruta raiz siempre va al final o se le añade la instrucción "exact" para que funcione todo normal.

El link se usa para el mapeo de rutas, como si fuera la propiedad href de html.

Al navLink se le puede agregar el atributo de activeClassName para con clases agregarle cuando se cliquee.

### Consumir API

Leer parametros en la URL, useParams guarda el parametro dentro de un objeto

~~~javascript
import React from 'react';
import { useParams } from 'react-router-dom'


const nombreComponente = (props) => {
  
    const {nomParam} = useParams(); //Guardar el parametro en un una variable
    consolo.log(useParams());
    
    const obtenerDatos = async () =>{
        const data = await fetch(`url`);
        const datos = await data.json();
    }
    
    
   return (
      
    );
}

export default nombreComponente;
~~~

El useEffect no bloquea el render de la pagina, y queda a la escucha 







~~~java
import './App.css';
import React, { createContext, useContext, useReducer, useEffect, useRef, useState } from 'react'


const HOST_API = 'http://localhost:8080/api';

const initialState = {
  list: []
};
const Store = createContext(initialState);

const Form = () => {

  const formRef = useRef(null);
  const [state, setState]=useState({});

  const onAdd = (event) => {
    event.preventDefault();

    const request = {
      name: state.name,
      description: state.description,
      id: null,
      isCompleted: false
    };

    fetch(HOST_API+"/todos", {
      method: 'POST',
      body: JSON.stringify(request),
      headers: {
        'Content-Type': 'application/json'
      }
    })
    .then(response => response.json())
    .then((todo)=>{
      dispatch({ type: "add-item", item: todo });
      setState({ name: "", description: ""});
      formRef.current.reset();

    });

  }


  return (
    <form ref={formRef}>
      <input type="text" name="name" onChange={(event) => {
        setState({ ...state, name: event.target.value })
      }}></input>
      <input type="text" name="description" onChange={(event) => {
        setState({ ...state, description: event.target.value })
      }}></input>
      <button onClick={onAdd}>Agregar</button>
    </form>
  )
}



const List = () => {

  const { dispatch, state } = useContext(Store)

  useEffect(() => {
    fetch(HOST_API + "/todos")
      .then(response => response.json())
      .then((list) => {
        dispatch({ type: "update-list", list })
      })
  }, [state.list.length, dispatch]);


  return <div>

    <table>
      <thead>
        <tr>
          <td>ID</td>
          <td>Nombre</td>
          <td>¿Está completado?</td>
        </tr>
      </thead>
      <tbody>
        {state.list.map((todo) => {
          return <tr key={todo.id}>
            <td>{todo.id}</td>
            <td>{todo.name}</td>
            <td>{todo.isCompleted}</td>
          </tr>;
        })};
      </tbody>
    </table>
  </div>
}

function reducer(state, action) {
  switch (action.type) {
    case 'update-list':
      return { ...state, list: action.list }
    case 'add-item':
      const newList = state.list;
      newList.push(action.item);
      return { ...state, list: newList }
    default:
      return state;

  }
}


const StoreProvider = ({ children }) => {
  const [state, dispatch] = useReducer(reducer, initialState)
  return <Store.Provider value={{ state, dispatch }}>
    {children}
  </Store.Provider>

}





function App() {
  return (
    <div>
      <StoreProvider>
        <Form/>
        <List />
      </StoreProvider>
    </div>
  );
}

export default App;

~~~

