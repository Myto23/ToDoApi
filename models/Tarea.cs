using System;

namespace ToDoApi.Models
{
    public class Tarea
    {
        public int ID { get; set; }
        public string Descripcion { get; set; }
        public DateTime Fecha { get; set; }
        public int UsuarioId { get; set; } 
        public Usuario Usuario { get; set; }
    }

}
