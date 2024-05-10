using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SpendwiseApp.DAL;
using SpendwiseApp.Models;
using System.Globalization;
using System.Linq;
using System.Collections.Generic;

namespace SpendwiseApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class billTableController : ControllerBase
    {
        private readonly AppDbContext _context;

        public billTableController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Get()
        {
            try
            {
                var table = _context.BillTable.ToList();
                if (table == null)
                {
                    return NotFound("not available any darta");
                }
                return Ok(table);

            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }

        [HttpGet("{fs_id}")]
        public IActionResult GetById(int fs_id, DateTime date)
        {
            try
            {
                // Use .Where() or .FirstOrDefault() to filter by fs_id
                var bills = _context.BillTable
                                    .Where(b => b.fs_main_id == fs_id &&
                                    b.data.Year == date.Year &&
                                    b.data.Month == date.Month)
                                    .ToList();

                // Check if any bills are returned from the query
                if (!bills.Any()) // This checks if the returned list is empty
                {
                    return NotFound("No data available for the provided ID.");
                }

                return Ok(bills); // Return the list of bills with the matching fs_id
            }
            catch (Exception ex)
            {
                // Return a BadRequest with the exception message
                return BadRequest(ex.Message);
            }
        }

        [HttpPost("AddData")]
        public IActionResult Post(billTable table)
        {
            try
            {
                var tableData = _context.BillTable.Add(table);
                _context.SaveChanges();
                return Ok("data added successfully");
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }

        [HttpPut("EditData")]
        public IActionResult Put(billTable table)
        {

            if(table == null || table.b_id==0)
            {
                return NotFound("Cannot edit the data");
                   
            }

            try
            {
                var curretTableData = _context.BillTable.Find(table.b_id);
                curretTableData.b_id = table.b_id;
                curretTableData.bill_no = table.bill_no;
                curretTableData.data = table.data;
                curretTableData.expense_category = table.expense_category;
                curretTableData.desc = table.desc;
                curretTableData.amount = table.amount;
                _context.SaveChanges();
                return Ok("Data updated successfully");
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }

        }

        [HttpDelete("Delete")]
        public IActionResult Delete(int id)
        {
      
           var data = _context.BillTable.Find(id);

            if (data == null)
            {
                return BadRequest("data is not found and the id : "+id);
            }
            try
            {
                _context.BillTable.Remove(data);
                _context.SaveChanges();
                return Ok();
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }


        [HttpGet("SpendWiseSum/{id}")]
        public IActionResult GetSpendSum(int id) 
        {
            try
            {
                var sum = _context.BillTable.Where(item => item.fs_main_id == id).Sum(s => s.amount);
                return Ok(sum);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }

        [HttpGet("GrandTotal/{date}")]
        public IActionResult GrandTotal(DateTime date)
        {
            try
            {
                var sum = _context.BillTable.Where(d => d.data.Year == date.Year && d.data.Month == date.Month).Sum(s => s.amount);
                return Ok(sum);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }


        [HttpGet("home/{date}")]
        public IEnumerable<object> home(DateTime date)
        {


            try
            {
                var result = _context.BillTable
                   .Where(bill => bill.data.Year == date.Year && bill.data.Month == date.Month)
                   .AsEnumerable() // Switch to LINQ to Objects
                   .GroupBy(bill => new { bill.fs_main_id }) // Grouping without formatting date
                   .Select(g => new
                   {
                       fs_main_id = g.Key.fs_main_id,
                       total_amount = g.Sum(bill => bill.amount),
                       year_month = $"{date.Year}-{date.Month.ToString("00")}" // Format the date here
                   })
                   .ToList();

                return result;
            }
            catch (Exception)
            {

                throw;
            }
        }



        [HttpGet("homed/{fs_id}/{date}")]
        public decimal HomeSum(int fs_id, DateTime date)
        {

            /*
                        var result = _context.BillTable 
                        .Where(bill => bill.fs_main_id == fs_id && bill.data.Year == date.Year && bill.data.Month == date.Month)
                        .AsEnumerable() // Switch to LINQ to Objects
                        .GroupBy(bill => new { bill.fs_main_id }) // Grouping without formatting date
                        .Select(g => new
                        {
                            fs_main_id = g.Key.fs_main_id,
                            total_amount = g.Sum(bill => bill.amount),
                            year_month = $"{date.Year}-{date.Month.ToString("00")}" // Format the date here
                        })
                        .ToList();

                        return result;
            */
            var totalAmount = _context.BillTable
                    .Where(bill => bill.fs_main_id == fs_id && bill.data.Year == date.Year && bill.data.Month == date.Month)
                    .Sum(bill => bill.amount);

            return  totalAmount;
        }

    }

}
