# NX NOTES

## Install nx 

For local install of nx

~~~shell
npm install -D nx
~~~

## Run

For run a specific app

~~~shell
nx serve <name-app>
~~~

## New workspace

~~~shell
npx create-nx-workspace <name-workspace>

# pass @latest in case npx cached an older version of create-nx-workspace
npx create-nx-workspace@latest
~~~

## Add angular app

~~~shell
npm add -D @nrwl/angular
nx g @nrwl/angular:app
~~~

## Add lib

~~~shell
nx g @nrwl/angular:lib <name-lib>
~~~

## Graph

~~~shell
nx dep-graph
~~~

view affected files

~~~shell
nx affected:dep-graph
~~~



## Help

~~~shell
nx g @nrwl/angular:app --help
~~~

