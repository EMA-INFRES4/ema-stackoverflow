using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StackEMA.Models;
using PagedList;

namespace StackEMA.Controllers
{
    public class PostController : Controller
    {
        private StackEMAContainer db = new StackEMAContainer();

        //
        // GET: /Post/
        [AllowAnonymous]
        public ActionResult Index(int page = 1, int size = 3)
        {
            var Posts = from LastPosts in db.Post
                            orderby LastPosts.Id descending
                            select LastPosts;
            Dictionary<string,object> dico = new Dictionary<string,object>();
            dico.Add("lasts", Posts.Skip(0).Take(3).ToList());
            dico.Add("all", Posts.ToList().ToPagedList(page, size));
            ViewBag.size = size;
            return View(dico);
        }

        //
        // GET: /Post/Details/5

        [AllowAnonymous]
        public ActionResult Details(int id = 0)
        {
            Post post = db.Post.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            return View(post);
        }
        //
        // POST: /Post/Details/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Details(int id = 0, Models.Reply reply = null)
        {
            var email = User.Identity.Name;
            var user = db.User.FirstOrDefault(_ => _.Email == email);
            var post = db.Post.FirstOrDefault(_ => _.Id == id);
            //post.User = Session["user"];
            if (ModelState.IsValid)
            {
                reply.User = user;
                reply.Post = post;
                reply.Date = DateTime.Now;
                db.Reply.Add(reply);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(post);
        }

        //
        // GET: /Post/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Post/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Post post)
        {
            var email = User.Identity.Name;
            var user = db.User.FirstOrDefault(_ => _.Email == email);
            //post.User = Session["user"];
            if (ModelState.IsValid)
            {
                post.User = user;
                post.Date = DateTime.Now;
                db.Post.Add(post);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(post);
        }

        //
        // GET: /Post/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Post post = db.Post.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            return View(post);
        }

        //
        // POST: /Post/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Post post)
        {
            if (ModelState.IsValid)
            {
                db.Entry(post).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(post);
        }

        //
        // GET: /Post/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Post post = db.Post.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            return View(post);
        }

        //
        // POST: /Post/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Post post = db.Post.Find(id);
            db.Post.Remove(post);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}