from application import app, db
from application.models import Tasks

@app.route("/")
@app.route("/home")
def home():
    all_tasks = Tasks.query.all()
    output = ""
    for task in all_tasks:
        output += task.description + " - Completed? " + str(task.completed) + "<br>"
    return output

@app.route("/create")
def create():
    new_todo = Tasks(description = "New task")
    db.session.add(new_todo)
    db.session.commit()
    return "New Task Added"

@app.route("/complete/<int:id>")
def complete(id):
    task = Tasks.query.filter_by(id=id).first()
    task.complete = True
    db.session.commit()
    return "Task is now complete"

@app.route("/incomplete/<int:id>")
def incomplete(id):
    task = Tasks.query.filter_by(id=id).first()
    task.complete = False
    db.session.commit()
    return f"Task {id} is now incomplete"

@app.route("/update/<int:new_description>")
def update(id):
    task= Task.query.order_by(Tasks.id.desc()).first()
    task.description = new_description
    db.session.commit()
    return f"Most recent task was updated with the description: {new_description}"#

@app.route("/delete/<int:id>")
def delete(id):
    task = Tasks.query.filter_by(id=id).first()
    db.session.delete(task)
    return f"Task {id} was deleted"