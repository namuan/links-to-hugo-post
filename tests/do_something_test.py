from links_to_hugo_post.workflow import DoSomething


def test_do_something_step() -> None:
    context: dict = {}

    step_type = DoSomething
    step = step_type(context, step_type)
    step.run(context)

    assert context["result"] == "Do something"
