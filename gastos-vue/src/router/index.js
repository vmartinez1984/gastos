import { createRouter, createWebHistory } from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import ListaDePeriodos from '@/components/periodos/ListaDePeriodos'
import PeriodoDetalles from '@/components/periodos/PeriodoDetalles'
import ListaDeSubcategorias from '@/components/subcategorias/ListaDeSubcategorias'
import FormularioDeSubcategoria from '@/components/subcategorias/FormularioDeSubcategoria'
import FormularioDeGasto from '@/components/gastos/FormularioDeGasto'
import FormularioDeApartado  from '@/components/apartados/FormularioDeApartado'

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
        path:'/subcategorias',
        name: 'listaDeSubcategorias',
        component: ListaDeSubcategorias
    },
    {
        path:'/subcategorias/agregar',
        name: 'formularioDeSubcategorias',
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
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})

export default router