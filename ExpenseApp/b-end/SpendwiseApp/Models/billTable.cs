using Microsoft.VisualBasic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SpendwiseApp.Models
{
    public class billTable
    {
        [Key]
        public int b_id { get; set; }

        //[ForeignKey("mainList")]
        public int fs_main_id { get; set; }
       // public mainList mainList { get; set; }

        public DateTime data { get; set; }
        public string bill_no { get; set; }

        public string expense_category { get; set; }

        public string desc { get; set; }

        public decimal amount { get; set; }
    }
}
