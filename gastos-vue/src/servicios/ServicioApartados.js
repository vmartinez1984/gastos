import axios from "axios";
import baseUrl from './BaseUrl'

const url = baseUrl.urlBase + 'apartados/'

export default {

    async agregarAsync(apartado) {
        var response

        console.log("post",apartado)
        response = await axios.post(
            url,
            {
                "tipoDeApartadoId": apartado.tipoDeApartadoId,
                "nombre": apartado.nombre,
                "intereses": apartado.intereses,
                "cantidadInicial": apartado.cantidadInicial,
                "cantidadFinal": apartado.cantidadFinal,
                "fechaInicial": apartado.fechaInicial,
                "fechaFinal": apartado.fechaFinal,
                "periodoId": apartado.periodoId,
                "subcategoriaIdGuid": apartado.subcategoriaId + "",
                "guid": apartado.idemPotency
            }
        )
        console.log(response)

        return response.data
    },

    async actualizarAsycn(apartado) {
        var response

        response = await axios.put(
            url + apartado.id,
            {
                "tipoDeApartadoId": apartado.tipoDeApartadoId,
                "nombre": apartado.nombre,
                "intereses": apartado.intereses,
                "cantidadInicial": apartado.cantidadInicial,
                "cantidadFinal": apartado.cantidadFinal,
                "fechaInicial": apartado.fechaInicial,
                "fechaFinal": apartado.fechaFinal,
                "periodoId": apartado.periodoId,
                "subcategoriaIdGuid": apartado.subcategoriaId + ""
            }
        )
        console.log(response)

        return response.data
    },

    async obtenerTodosAsync() {
        var response

        response = await axios({
            url: url,
            method: 'GET'
        })

        return response.data
    },

    async obtenerAsync(apartadoId) {
        var response

        response = await axios({
            url: url + apartadoId,
            method: 'GET'
        })

        return response.data
    },
    
    async borrarAsync(apartadoId) {
        var response

        response = await axios({
            url: url + apartadoId,
            method: 'DELETE'
        })

        return response.data
    }   
}