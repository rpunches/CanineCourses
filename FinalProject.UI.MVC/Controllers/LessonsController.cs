using FinalProject.DATA.EF;
using Microsoft.AspNet.Identity;
using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace FinalProject.UI.MVC.Controllers
{
    public class LessonsController : Controller
    {
        private CanineCoursesEntities db = new CanineCoursesEntities();

        // GET: Lessons
        public ActionResult Index()
        {
            var lessons = db.Lessons.Include(l => l.Cours);
            return View(lessons.ToList());
        }

        // GET: Lessons/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }

            if (lesson.VideoURL != null)
            {

            }

            //var views = db.UserDetails.Include(i => i.UserId).Include(i => lesson.LessonId).Include(i => DateTime.Now);
            //var views = db.LessonViews.Include(l => l.Lesson).Include(l => l.UserDetail).Include(l => l.UserId).Include(l => (DateTime.Now));
            var currentUser = User.Identity.GetUserId();
            var lessonNotViewed = db.LessonViews.Where(lv => lv.LessonId == lesson.LessonId && lv.UserId == currentUser).Count();
            if (lessonNotViewed == 0)
            {

                LessonView newView = new LessonView
                {
                    UserId = User.Identity.GetUserId(),
                    LessonId = lesson.LessonId,
                    DateViewed = DateTime.Now
                };
                db.LessonViews.Add(newView);
                db.SaveChanges();

                #region Original completion Code

                //var counter = 0;
                ////var idCourse = from l in db.Lessons
                ////               select l.CourseId;
                //var idView = from v in db.LessonViews
                //             select v.LessonViewId;
                //var idCourse = from l in db.LessonViews
                //               join i in db.Lessons on l.LessonId equals i.LessonId
                //               select new { i.CourseId };

                //foreach (var view in db.LessonViews)
                //{
                //    if (idView.Count() != idCourse.Count())
                //    {
                //        counter += 1;
                //    }
                //    else
                //    {
                //        CourseCompletion completedCourse = new CourseCompletion();
                //        completedCourse.UserId = User.Identity.GetUserId();
                //        completedCourse.CourseId = lesson.CourseId;
                //        completedCourse.DateCompleted = DateTime.Now;
                //        db.CourseCompletions.Add(completedCourse);
                //        db.SaveChanges();
                //    }
                //}
                #endregion

                //Course completion should be created when the user has completed all lesson views associated to the course

                //A count will tell you how many lesson views but there is a possibility of a logic error if you do NOT prevent
                //multiple lesson views from being created for a single lesson for the same user. - Cared for with lesson not viewd on 44

                //get the course id and number of lessons associated to the course
                //var lessons = (from l in db.Lessons
                //              where l.CourseId == lesson.CourseId
                //              select l).Count();

                var lessonsByTHISCourse = db.Lessons.Where(Course => Course.CourseId == lesson.CourseId).Count();

                //get the number of lessons completed in the course by the user
                //var user = (from u in db.LessonViews
                //            where u.LessonViewId == lesson.LessonId
                //            select u).Count();

                //var lessonsTotalUser = db.LessonViews.Where(Lesson => Lesson.LessonId == lesson.LessonId).OrderBy(Lesson => Lesson.UserId).Count();

                var lessonsTotalUser = db.LessonViews.Where(lv => lv.LessonId == lesson.LessonId && lv.UserId == newView.UserId).Count();

                //if equal then create the course completed object
                if (lessonsByTHISCourse == lessonsTotalUser)
                {
                    CourseCompletion completedCourse = new CourseCompletion();
                    completedCourse.UserId = User.Identity.GetUserId();
                    completedCourse.CourseId = lesson.CourseId;
                    completedCourse.DateCompleted = DateTime.Now;
                    db.CourseCompletions.Add(completedCourse);
                    db.SaveChanges();
                }

            }

            #region Completion code attempt 1 archive
            //var complete = from c in db.LessonViews
            //               group c by c.LessonViewId into v
            //               select v;

            //var idCourse = from l in db.Lessons
            //               select l.CourseId;
            //var counter = 0;
            //foreach (var view in db.LessonViews)
            //{
            //    if (counter < idCourse.Count())
            //    {
            //        counter++;
            //    }
            //    else
            //    {
            //        CourseCompletion completedCourse = new CourseCompletion();
            //        completedCourse.UserId = User.Identity.GetUserId();
            //        completedCourse.CourseId = lesson.CourseId;
            //        completedCourse.DateCompleted = DateTime.Now;
            //    }
            //}
            #endregion

            return View(lesson);
        }

        // GET: Lessons/Create
        public ActionResult Create()
        {
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName");
            return View();
        }

        // POST: Lessons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LessonId,LessonTitle,CourseId,Introduction,VideoURL,PdfFileName,IsActive")] Lesson lesson, HttpPostedFileBase pdfFile)
        {
            if (ModelState.IsValid)
            {
                string imgName = "Blank.pdf";
                #region File Upload
                if (pdfFile != null)
                {
                    imgName = pdfFile.FileName;

                    string ext = imgName.Substring(imgName.LastIndexOf("."));

                    string[] goodExts = { ".pdf", ".jpg", ".jpeg", ".png" };

                    if (goodExts.Contains(ext.ToLower()) && (pdfFile.ContentLength <= 4194304))
                    {
                        imgName = Guid.NewGuid() + ext;
                        pdfFile.SaveAs(Server.MapPath("~/Content/lessons/" + imgName));
                    }
                    else
                    {
                        imgName = "Blank.pdf";
                    }
                }
                lesson.PdfFileName = imgName;
                #endregion

                db.Lessons.Add(lesson);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName", lesson.CourseId);
            return View(lesson);
        }

        // GET: Lessons/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName", lesson.CourseId);
            return View(lesson);
        }

        // POST: Lessons/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LessonId,LessonTitle,CourseId,Introduction,VideoURL,PdfFileName,IsActive")] Lesson lesson)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lesson).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseId = new SelectList(db.Courses, "CourseId", "CourseName", lesson.CourseId);
            return View(lesson);
        }

        // GET: Lessons/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }

        // POST: Lessons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Lesson lesson = db.Lessons.Find(id);
            db.Lessons.Remove(lesson);
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
