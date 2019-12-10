using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProject.DATA.EF;
using Microsoft.AspNet.Identity;

namespace FinalProject.UI.MVC.Controllers
{
    
    public class CourseCompletionsController : Controller
    {
        private CanineCoursesEntities db = new CanineCoursesEntities();

        // GET: CourseCompletions
        public ActionResult Index()
        {
            string userId = User.Identity.GetUserId();

            #region courseCompletions per User v1
            //if (User.IsInRole("User"))
            //{
            //    var currentUser = User.Identity.GetUserId();
            //    var myId = (from c in db.UserDetails
            //                     where c.UserId == currentUser
            //                     select c);
            //    //var myCourses = from c in db.CourseCompletions
            //    //                where c.UserId == currentUser
            //    //                select c;

            //    var completed = db.CourseCompletions.Include(i => i.Cours).Include(i => i.UserDetail);
            //    foreach (var course in db.CourseCompletions)
            //    {
            //        foreach (var id in myId)
            //        {
            //            if (course.UserId == id.UserId)
            //            {
            //                return View(completed.ToList());
            //            }
            //        }
            //    }
            //}
            #endregion

            //var myLessonViews = db.LessonViews.Where(x => x.UserId == userId);
            //var lessons = db.Lessons.ToList();
            var courseCompletions = db.CourseCompletions.Include(c => c.Cours).Include(c => c.UserDetail);
            

            return View(courseCompletions.ToList());
        }

        // GET: CourseCompletions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            if (courseCompletion == null)
            {
                return HttpNotFound();
            }
            return View(courseCompletion);
        }

        // GET: CourseCompletions/Create
        [Authorize(Roles = "Admin, Manager")]
        public ActionResult Create()
        {
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName");
            ViewBag.UserId = new SelectList(db.UserDetails, "UserId", "FirstName");
            return View();
        }

        // POST: CourseCompletions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CourseCompletionId,UserId,CourseId,DateCompleted")] CourseCompletion courseCompletion)
        {
            if (ModelState.IsValid)
            {
                db.CourseCompletions.Add(courseCompletion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

 

            //newView.UserId = User.Identity.GetUserId();
            //newView.LessonId = lesson.LessonId;
            //newView.DateViewed = DateTime.Now;
            //db.LessonViews.Add(newView);
            //db.SaveChanges();
            //List<Lesson> viewedList = new List<Lesson>();
            //Lesson view = new Lesson();
            //foreach (Lesson item in viewedList)
            //{
            //    if (viewedList.Count() < db.LessonViews.Count())
            //    {

            //    }
            //}


            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName", courseCompletion.CourseId);
            ViewBag.UserId = new SelectList(db.UserDetails, "UserId", "FirstName", courseCompletion.UserId);
            return View(courseCompletion);
        }

        // GET: CourseCompletions/Edit/5
        [Authorize(Roles = "Admin, Manager")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            if (courseCompletion == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName", courseCompletion.CourseId);
            ViewBag.UserId = new SelectList(db.UserDetails, "UserId", "FirstName", courseCompletion.UserId);
            return View(courseCompletion);
        }

        // POST: CourseCompletions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin, Manager")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CourseCompletionId,UserId,CourseId,DateCompleted")] CourseCompletion courseCompletion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(courseCompletion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName", courseCompletion.CourseId);
            ViewBag.UserId = new SelectList(db.UserDetails, "UserId", "FirstName", courseCompletion.UserId);
            return View(courseCompletion);
        }

        // GET: CourseCompletions/Delete/5
        [Authorize(Roles = "Admin, Manager")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            if (courseCompletion == null)
            {
                return HttpNotFound();
            }
            return View(courseCompletion);
        }

        // POST: CourseCompletions/Delete/5
        [Authorize(Roles = "Admin, Manager")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CourseCompletion courseCompletion = db.CourseCompletions.Find(id);
            db.CourseCompletions.Remove(courseCompletion);
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
