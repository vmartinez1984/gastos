import axios from "axios";
import baseUrl from './BaseUrl'

const url = baseUrl.urlBase + 'periodos/'

export default {
    async obtenerTodos() {
        var response

        response = await axios({
            url: url,
            method: 'GET'
        })

        return response.data
    },

    async obtener(id) {
        var response

        response = await axios({
            url: url + id + '/gastos',
            method: 'GET'
        })

        return response.data
    },

    async agregarAsync(periodo) {
        var response

        response = await axios.post(url, {
            "nombre": periodo.nombre,
            "fechaInicial": periodo.fechaInicial,
            "fechaFinal": periodo.fechaFinal
        })

        return response.data
    }

}