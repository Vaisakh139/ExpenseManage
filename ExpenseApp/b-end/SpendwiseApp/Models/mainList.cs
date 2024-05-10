using System.ComponentModel.DataAnnotations;

namespace SpendwiseApp.Models
{
    public class mainList
    {
        [Key]
        public int main_id { get; set; }

        public string spendCategories { get; set; }

        public decimal total { get; set; }

     //   public virtual ICollection<billTable> bTables { get; set; }
    }
}
