from links_to_hugo_post.workflow import CreateOutputFolder


def test_create_output_folder_step() -> None:
    context: dict = {
        "post_title": "test_title",
    }

    step_type = CreateOutputFolder
    step = step_type(context, step_type)
    step.run(context)

    assert context["target_folder"]
    assert context["child_links_folder"]
    assert context["thumbnails_folder"]
