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
            LessonView newView = new LessonView();
            newView.UserId = User.Identity.GetUserId();
            newView.LessonId = lesson.LessonId;
            newView.DateViewed = DateTime.Now;
            db.LessonViews.Add(newView);
            db.SaveChanges();
            

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
