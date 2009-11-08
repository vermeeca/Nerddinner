using System.Linq;

namespace Nerddinner.Models
{
    public interface IDinnerRepository
    {
        IQueryable<Dinner> FindAllDinners();
        IQueryable<Dinner> FindUpcomingDinners();
        Dinner GetDinner(int id);
        void Add(Dinner dinner);
        void Delete(Dinner dinner);
        void Save();
        IQueryable<Dinner> FindByLocation(float latitude, float longitude);
    }
}