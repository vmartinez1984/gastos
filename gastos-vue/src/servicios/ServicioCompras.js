import axios from "axios";
import baseUrl from './BaseUrl'

const url = baseUrl.urlBase + 'compras/'

export default {
    
    async agregarAsync(compra) {
        var response

        response = await axios.post(
            url,
            {
                "nombre": compra.nombre,
                "mesesSinIntereses": compra.mesesSinIntereses,
                "cantidad": compra.cantidad,
                "tdcId": 1,
                "fechaDeRegistro": compra.fechaDeRegistro
            }
        )
        console.log(response)

        return response.data
    },

    async obtenerTodosAsync(){
        var response

        response = await axios({
            url: url,
            method: 'GET'
        })

        return response.data
    }
}