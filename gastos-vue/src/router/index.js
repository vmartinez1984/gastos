import { createRouter, createWebHistory } from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import ListaDePeriodos from '@/components/periodos/ListaDePeriodos'
import FormularioDePeriodo from '@/components/periodos/FormularioDePeriodo'
import PeriodoDetalles from '@/components/periodos/PeriodoDetalles'
import ListaDeSubcategorias from '@/components/subcategorias/ListaDeSubcategorias'
import FormularioDeSubcategoria from '@/components/subcategorias/FormularioDeSubcategoria'
import FormularioDeGasto from '@/components/gastos/FormularioDeGasto'
import FormularioDeApartado  from '@/components/apartados/FormularioDeApartado'
import ListaDeApartados from '@/components/apartados/ListaDeApartados'
import IncrementoDeApartados from '@/components/apartados/IncrementoDeApartados'

const routes = [
    {
        path: '/',
        name: 'helloWorld',
        component: HelloWorld
    },
    {
        path:'/periodos',
        name: 'listaDePeriodos',
        component: ListaDePeriodos
    },
    {
        path:'/periodos/detalles/:id',
        name: 'periodoDetalles',
        component: PeriodoDetalles
    },
    {
        path:'/periodo/agregar',
        name: 'agregarPeriodo',
        component: FormularioDePeriodo
    },
    {
        path:'/periodo/editar/:id',
        name: 'editarPeriodo',
        component: FormularioDePeriodo
    },
    {
        path:'/subcategorias',
        name: 'listaDeSubcategorias',
        component: ListaDeSubcategorias
    },
    {
        path:'/subcategorias/agregar',
        name: 'agregarSubcategoria',
        component: FormularioDeSubcategoria
    },
    {
        path:'/subcategorias/editar/:id',
        name: 'editarSubcategoria',
        component: FormularioDeSubcategoria
    },
    {
        path:'/gastos/agregar',
        name: 'formularioDeGasto',
        component: FormularioDeGasto
    },
    {
        path:'/apartados/agregar',
        name: 'formularioDeApartado',
        component: FormularioDeApartado
    },
    {
        path:'/apartados/incrementar',
        name: 'incrementoDeApartados',
        component: IncrementoDeApartados
    },
    {
        path:'/apartados/editar/:id',
        name: 'editarApartado',
        component: FormularioDeApartado
    },
    {
        path:'/apartados',
        name: 'listaDeApartados',
        component: ListaDeApartados
    },
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})

export default router