<template>
    <div class="card">
        <div class="card-header">
            <h3>Agregar gasto</h3>
        </div>
        <div class="card-body">
            <form @submit.prevent="guardarAsync">                
                <div class="row mt-1">
                    <div class="col-2">
                        <label class="form-label">Nombre</label>
                    </div>
                    <div class="col-10">
                        <input type="text" v-model="compra.nombre" class="form-control" />
                    </div>
                </div>
                <div class="row mt-1">
                    <div class="col-2">
                        <label class="form-label">Nota</label>
                    </div>
                    <div class="col-10">
                        <input type="text" v-model="compra.nota" class="form-control" />
                    </div>
                </div>

                <div class="row mt-1">
                    <div class="col-2">
                        <label class="form-label">Meses sin intereses</label>
                    </div>
                    <div class="col-10">
                        <select class="form-select" v-model="compra.mesesSinIntereses">
                            <option value="1">1</option>
                            <option value="3">3</option>
                            <option value="6">6</option>
                            <option value="9">9</option>
                            <option value="12">12</option>
                            <option value="15">15</option>
                        </select>
                    </div>
                </div>

                <div class="row mt-1">
                    <div class="col-2">
                        <label class="form-label">$</label>
                    </div>
                    <div class="col-10">
                        <input type="number" step="0.01" v-model="compra.cantidad" class="form-control" />
                    </div>
                </div>

                <div class="row mt-1">
                    <div class="col-2">
                        <label class="form-label">Fecha de compra</label>
                    </div>
                    <div class="col-10">
                        <input type="date" v-model="compra.fechaDeRegistro" class="form-control" />
                    </div>
                </div>

                <div class="row mt-1">
                    <div class="col-2">
                        <router-link :to="{name: 'listaDeCompras' }">
                            Regresar
                        </router-link>
                    </div>
                    <div class="col-10">
                        <button class="btn btn-primary">
                            Guardar
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</template>
<script setup>
import { ref } from 'vue'
import Formato from '@/ayudantes/Formato'
import servicioCompras from '@/servicios/ServicioCompras'
import route from '@/router'

var compra = ref({
    mesesSinIntereses:1,
    fechaDeRegistro: Formato.formatearFecha()
})
var estaCargando = ref(false)

const guardarAsync = async ()=>{
  try{
    estaCargando.value = true

    await servicioCompras.agregarAsync(compra.value)

    route.push({ name: 'listaDeCompras'})
  }catch(error){
    console.log(error)
  }finally{
    estaCargando.value = true
  }
}
</script>