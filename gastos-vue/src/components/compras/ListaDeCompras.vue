<template>
    <div class="card">
        <div class="card-header">
            <h4>Lista de comparas con TDC</h4>
            <router-link :to="{name: 'agregarCompra'}"> Agregar compra</router-link>
        </div>
        <div class="card-body">
            <div class="row" v-for="compra in compras" :key="compra.id">
                <div class="col">{{ compra.id }}</div>
                <div class="col">{{ compra.mesesSinIntereses }}</div>
                <div class="col">{{ compra.nombre }}</div>
                <div class="col text-end">{{ Formato.formatearMoneda(compra.cantidad) }}</div>
                <div class="col">{{ compra.fechaDeRegistro.toString().substring(0, 10) }}</div>
                <div class="col">{{ compra.fechaDePago.toString().substring(0, 10) }}</div>
                <div class="col">{{ compra.numeroDePago }}</div>
                <div class="col text-end">{{ Formato.formatearMoneda(compra.pago) }}</div>
            </div>
        </div>
        <p>{{ Formato.formatearMoneda(total.totalDeCompras) }}</p>
        <p>{{ Formato.formatearMoneda(total.totalDelMes) }}</p>
        <hr/>
        <p>{{ Formato.formatearMoneda(total.totalDeCompras - total.totalDelMes) }}</p>
    </div>
</template>
<script setup>
import servicioCompras from '@/servicios/ServicioCompras';
import { ref, onMounted } from 'vue';
import Formato from '@/ayudantes/Formato';

var compras = ref([])
var total = ref({
    totalDeCompras:0,
    totalDelMes: 0
})

const obtenerComprasAsync = async () => {
    compras.value = await servicioCompras.obtenerTodosAsync()    
    compras.value.forEach(compra => {
        total.value.totalDeCompras += compra.cantidad
        total.value.totalDelMes += compra.pago
    })
}

onMounted(async () => {
    await obtenerComprasAsync()
})
</script>