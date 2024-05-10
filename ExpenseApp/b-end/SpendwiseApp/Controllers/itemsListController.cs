using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SpendwiseApp.DAL;

namespace SpendwiseApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class itemsListController : ControllerBase
    {

        private readonly AppDbContext _items;

        public itemsListController(AppDbContext items)
        {
            _items = items;
        }



        [HttpGet("itemsListId/{fs_id}")]
        public IActionResult GetById(int fs_id)
        {
            try
            {
               
                if(fs_id == 0)
                {
                    var ListAllItems = _items.ItemsList.ToList();
                    return Ok(ListAllItems);
                }
                else 
                {
                    var ListItems = _items.ItemsList.Where(d => d.main_id == fs_id).ToList();
                    return Ok(ListItems);
                }
                
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }


    }
}
