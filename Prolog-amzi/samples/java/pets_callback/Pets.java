/**
 * Pets Local with Extended Predicates
 *
 * This sample uses the tiny pet identification
 * expert system to illustrate both multiple logic
 * servers and extended predicates in Java.
 *
 * This particular example shows how to create a
 * separate class for extended predicates, but
 * the predicates could be just as easily defined
 * in the same class.
 *
 * To test the error handling, rename the file
 * pets.xpl to something else and run the program.
 */

import amzi.ls.*;

class Pets
{
   LogicServer ls;

   public static void main(String args[])
   {
      try
      {
         Pets p1, p2;
         p1 = new Pets();
         p2 = new Pets();

         System.out.println("Pet 1 is a " + p1.GetPet());
         System.out.println("Pet 2 is a " + p2.GetPet());

         p1.close();
         p2.close();
      }
      catch (LSException e)
      {
         System.out.println(e.GetMsg());
      }
   }

   public Pets() throws LSException
   {
      // create and initialize a logic server using
      // Init2 to specify small control stack settings
      // for this small application
      ls = new LogicServer();
      ls.Init2("h=100, l=100, c=100, t=100");

      // create an extended predicate library
      // that initializes its own predicates
      AmziPreds ap = new AmziPreds(ls);

      // load the compiled Prolog expert system
      ls.Load("pets");
   }

   public String GetPet() throws LSException
   {
      long term;

      term = ls.ExecStr("pet(X)");
      if (term != 0)
         return ls.GetStrArg(term, 1);
      else
         return "unknown";
   }

   public void close() throws LSException
   {
      if (ls != null)
         ls.Close();
   }
}
