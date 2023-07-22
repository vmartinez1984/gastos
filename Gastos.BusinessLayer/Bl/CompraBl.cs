using AutoMapper;
using Gastos.BusinessLayer.Helpers;
using Gastos.Core.Dtos;
using Gastos.Core.Entities;
using Gastos.Core.Interfaces.IBusinessLayer;
using Gastos.Core.Interfaces.IRepositories;

namespace Gastos.BusinessLayer.Bl
{
    public class CompraBl : BaseBl, ICompraBl
    {
        public CompraBl(IRepositorio repositorio, IMapper mapper) : base(repositorio, mapper)
        {
        }

        public async Task ActualizarAsync(CompraDtoIn item, int id)
        {
            CompraEntity entity;

            entity = await _repositorio.Compra.ObtenerAsync(id);
            entity.MesesSinIntereses = item.MesesSinIntereses;
            entity.TdcId = item.TdcId;
            entity.Cantidad = item.Cantidad;
            entity.Nombre = item.Nombre;
            entity.Nota = item.Nota;
            AgregarListaDePagos(entity);

            await _repositorio.Compra.ActualizarAsync(entity);
        }

        public async Task<IdDto> AgregarAsync(CompraDtoIn item)
        {
            CompraEntity entity;

            entity = _mapper.Map<CompraEntity>(item);
            AgregarListaDePagos(entity);
            entity.Id = await _repositorio.Compra.AgregarAsync(entity);

            return new IdDto { Guid = (Guid)entity.Guid, Id = entity.Id };
        }

        private void AgregarListaDePagos(CompraEntity entity)
        {
            TdcDto tdcDto;

            tdcDto = ObtenerTdc(entity.TdcId);
            for (int i = 0; i < entity.MesesSinIntereses; i++)
            {
                entity.ListaDePagos.Add(new PagoEntity
                {
                    NumeroDePago = i + 1,
                    CantidadDepositada = 0,
                    CantidadEsperada = entity.Cantidad / entity.MesesSinIntereses,
                    FechaDePago = ObtenerFechaDePago(i, entity.MesesSinIntereses, tdcDto, entity.FechaDeRegistro)
                });
            }
        }

        private DateTime ObtenerFechaDePago(int numeroDePago, int totalDePagos, TdcDto tdcDto, DateTime fechaDeRegistro)
        {
            DateTime fechaDePago;
            DateTime fechaDeCorte;

            fechaDeCorte = GetDateCut(tdcDto.DateCut.Day, fechaDeRegistro);
            fechaDePago = fechaDeCorte.AddMonths(numeroDePago).AddDays(20);

            return fechaDePago;
        }

        public async Task BorrarAsync(int id)
        {
            await _repositorio.Compra.BorrarAsync(id);
        }

        public async Task<CompraDto> ObtenerAsync(int id)
        {
            CompraDto dto;
            CompraEntity entity;

            entity = await _repositorio.Compra.ObtenerAsync(id);
            dto = _mapper.Map<CompraDto>(entity);            

            return dto;
        }

        public async Task<List<CompraDto>> ObtenerPorTdcIdAsync(int tdcId)
        {
            List<CompraDto> lista;
            List<CompraEntity> entities;
            TdcDto tdcDto;

            tdcDto = ObtenerTdc(tdcId);
            entities = await _repositorio.Compra.ObtenerPorTdcIdAsync(tdcId);
            lista = _mapper.Map<List<CompraDto>>(entities);
            lista.ForEach(item =>
            {
                FechaDePagoDto datePay;

                //Fecha de corte                
                item.FechaDeCorte = GetDateCut(tdcDto.DateCut.Day, item.FechaDeRegistro);
                item.ListaDeFechaDePagos = GetListDatePays(item.FechaDeCorte, item.MesesSinIntereses);
                datePay = item.ListaDeFechaDePagos.Where(x => x.EsActual).FirstOrDefault();
                if (datePay == null)
                {
                    datePay = item.ListaDeFechaDePagos.FirstOrDefault();
                }
                item.FechaDePago = datePay.Fecha;
                item.NumeroDePago = datePay.NumeroDePago;
                if (item.MesesSinIntereses == 0)
                {
                    item.Pago = item.Cantidad;
                }
                else
                {
                    item.Pago = item.Cantidad / item.MesesSinIntereses;
                }
                item.NumeroDePago = ObtenerNumeroDePago(item.ListaDePagos); 
            });

            return lista;
        }

        private int ObtenerNumeroDePago(List<PagoDto> listaDePagos)
        {
            PagoDto pago;

            pago = listaDePagos.Where(x => x.FechaDePago.Year == DateTime.Now.Year && x.FechaDePago.Month == DateTime.Now.Month).FirstOrDefault();
            if (pago == null)
            {
                return 0;
            }
            else
            {
                return pago.NumeroDePago;
            }
        }

        private TdcDto ObtenerTdc(int tdcId)
        {
            int diaDeCorte;

            diaDeCorte = 3;
            return new TdcDto
            {
                Id = tdcId,
                DateCut = new DateTime(DateTime.Now.Year, DateTime.Now.Month, diaDeCorte),
                DatePay = new DateTime(DateTime.Now.Year, DateTime.Now.Month, diaDeCorte + 20)
            };
        }

        private DateTime GetDateCut(int dayCut, DateTime dateRegistration)
        {
            DateTime dateCut;

            dateCut = new DateTime(dateRegistration.Year, dateRegistration.Month, dayCut);

            if (dateRegistration >= dateCut)
            {
                return dateCut.AddMonths(1);
            }
            else
            {
                return dateCut;
            }
        }

        private List<FechaDePagoDto> GetListDatePays(DateTime dateCut, int monthsWhitoutInterest)
        {
            DateTime dateFirtsPay;
            List<FechaDePagoDto> list;

            monthsWhitoutInterest = monthsWhitoutInterest == 0 ? 1 : monthsWhitoutInterest;
            dateFirtsPay = dateCut.AddDays(20);
            list = new List<FechaDePagoDto>();
            for (int i = 0; i < monthsWhitoutInterest; i++)
            {
                list.Add(new FechaDePagoDto
                {
                    Fecha = dateFirtsPay.AddMonths(i),
                    NumeroDePago = i + 1,
                    EsActual = dateFirtsPay.AddMonths(i).Month == DateTime.Now.Month && dateFirtsPay.AddMonths(i).Year == DateTime.Now.Year ? true : false,
                });
            }

            return list;
        }
    }
}
