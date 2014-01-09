package IterationTag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.IterationTag;
import javax.servlet.jsp.tagext.Tag;

// I wrote this. ~ Todd Gerspacher
public class RepeatBack implements IterationTag {

   private int times;
   
   public void setTimes(int times) {
      if(times > 0) {
         this.times = times;
      }
   }
   
   @Override
   public int doStartTag() throws JspException {
      // evaluate the tag's body
      return EVAL_BODY_INCLUDE;
   }
   
   @Override
   public int doEndTag() throws JspException {
      return EVAL_PAGE;
   }


   @Override
   public Tag getParent() {
      return parent;
   }

   @Override
   public void release() {
      // TODO Auto-generated method stub
   }

   private PageContext pageContext;
   
   @Override
   public void setPageContext(PageContext pageContext) {
      this.pageContext = pageContext;
   }

   private Tag parent;
   
   @Override
   public void setParent(Tag parent) {
      this.parent = parent;
   }

   private int count = 0;
   
   @Override
   public int doAfterBody() throws JspException {
      if(count < times) {
         count++;
         return EVAL_BODY_AGAIN;
      }
      
      return SKIP_BODY;
   }

}
