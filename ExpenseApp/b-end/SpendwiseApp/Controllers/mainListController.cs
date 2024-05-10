using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SpendwiseApp.DAL;

namespace SpendwiseApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class mainListController : ControllerBase
    {
        private readonly AppDbContext _context;

        public mainListController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet("mainList")]
        public IActionResult get()
        {
            try
            {
                var list = _context.MainList.ToList();
                if (list == null)
                {
                    return NotFound("no data");
                }
                return Ok(list);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }

        [HttpGet("Sum")]
        public IActionResult  GetSum()
        {
            try
            {
                var sum = _context.MainList.Sum(item => item.total);
                return Ok(sum);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }
    }
}
