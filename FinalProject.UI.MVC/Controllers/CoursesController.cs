using FinalProject.DATA.EF;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace FinalProject.UI.MVC.Controllers
{
    public class CoursesController : Controller
    {
        private CanineCoursesEntities db = new CanineCoursesEntities();

        // GET: Courses
        public ActionResult Index()
        {
            return View(db.Courses.ToList());
        }

        // GET: Courses/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            //var courseLesson = (from l in db.Lessons
            //                   where l.CourseId == course.CourseId
            //                   select l).ToList();

            return View(course);
        }

        // GET: Courses/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: Courses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CourseId,CourseName,CourseDescription,IsActive")] Course course)
        {
            if (ModelState.IsValid)
            {
                db.Courses.Add(course);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(course);
        }

        // GET: Courses/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: Courses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CourseId,CourseName,CourseDescription,IsActive")] Course course)
        {
            if (ModelState.IsValid)
            {
                db.Entry(course).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }


            #region Lesson and Course IsActive v1
            //if (course.IsActive == false && lesson.CourseId == course.CourseId && lesson.IsActive == true)
            //{
            //    lesson.IsActive = false;
            //}
            //else if (course.IsActive == true && lesson.CourseId == course.CourseId && lesson.IsActive == false)
            //{
            //    lesson.IsActive = true;
            //}
            //else
            //{
            //    return RedirectToAction("Edit/" + course.CourseId);
            //}
            #endregion
            #region Lesson and Course IsActive v2
            //if (lesson.CourseId == course.CourseId && course.IsActive == false && lesson.IsActive == true)
            //{
            //    lesson.IsActive = !lesson.IsActive;
            //}
            //else if (lesson.CourseId == course.CourseId && course.IsActive == true && lesson.IsActive == false)
            //{
            //    !lesson.IsActive = lesson.IsActive;
            //}  
            #endregion
            #region Lesson and Course IsActive v3
            //Lesson lesson = new Lesson();
            //if (lesson.CourseId == course.CourseId && !course.IsActive)
            //{
            //    if (!course.IsActive)
            //    {
            //        lesson.IsActive = !lesson.IsActive;
            //    }
            //    else
            //    {
            //        lesson.IsActive = lesson.IsActive;
            //    }
            //}
            //db.SaveChanges();
            #endregion


            var lesson = (from l in db.Lessons
                         where l.CourseId == course.CourseId
                         select l).Single();

            if (course.IsActive == false)
            {
                lesson.IsActive = false;
            }
            else
            {
                lesson.IsActive = true;
            }
            db.SaveChanges();

            return View(course);
        }

        // GET: Courses/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: Courses/Delete/5
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Course course = db.Courses.Find(id);
            db.Courses.Remove(course);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
