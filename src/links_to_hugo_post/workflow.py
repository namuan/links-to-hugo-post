import logging

from py_executable_checklist.workflow import WorkflowBase


class DoSomething(WorkflowBase):
    def run(self, context: dict) -> None:
        logging.info(context)
        context["result"] = "Do something"


def workflow_steps() -> list:
    return [DoSomething]
