import axios from "axios";
import baseUrl from './BaseUrl'

const url = baseUrl.urlBase + 'categorias/'

export default{
    async obtenerAsync(){
        var response

        response = await axios({
            url: url,
            method: 'GET'
        })

        return response.data
    },
    
    /**
     * 
     * @param {int} categoriaId 
     * @returns subcategoria[]
     */
    async obtenerSubcategoriasPorCategoriasIdAsycn(categoriaId){
        var response

        response = await axios({
            url: url + categoriaId + '/subcategorias',
            method: 'GET'
        })

        return response.data        
    }
}