package BodyTagSupport;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class IfTag extends BodyTagSupport {
  private boolean predicate;

  public boolean isPredicate() {
    return predicate;
  }

  public void setPredicate(boolean predicate) {
    this.predicate = predicate;
  }

  @Override
  public int doAfterBody() throws JspException {
    try {
      bodyContent.writeOut(bodyContent.getEnclosingWriter());
      return SKIP_BODY;
    }
    catch (IOException ex) {
      throw new JspTagException(ex.toString());
    }
  }

  @Override
  public int doStartTag() throws JspException {
    if (isPredicate()) {
      return EVAL_BODY_BUFFERED; // EVAL_BODY_TAG;
    }
    else {
      return SKIP_BODY;
    }
  }

}
