using System.ComponentModel.DataAnnotations;

namespace SpendwiseApp.Models
{
    public class itemsList
    {
        [Key]
        public int items_id { get; set; }
        public int main_id { get; set; }
        public string items_name { get; set;}
    }
}
