-----------------------------------------------------------------------
--  Regtests.Images.Model -- Regtests.Images.Model
-----------------------------------------------------------------------
--  File generated by ada-gen DO NOT MODIFY
--  Template used: templates/model/package-body.xhtml
--  Ada Generator: https://ada-gen.googlecode.com/svn/trunk Revision 1095
-----------------------------------------------------------------------
--  Copyright (C) 2019 Stephane Carrez
--  Written by Stephane Carrez (Stephane.Carrez@gmail.com)
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.
-----------------------------------------------------------------------
with Ada.Unchecked_Deallocation;
with Util.Beans.Objects.Time;
package body Regtests.Images.Model is

   use type ADO.Objects.Object_Record_Access;
   use type ADO.Objects.Object_Ref;

   pragma Warnings (Off, "formal parameter * is not referenced");

   function Image_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => IMAGE_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Image_Key;

   function Image_Key (Id : in String) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => IMAGE_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Image_Key;

   function "=" (Left, Right : Image_Ref'Class) return Boolean is
   begin
      return ADO.Objects.Object_Ref'Class (Left) = ADO.Objects.Object_Ref'Class (Right);
   end "=";

   procedure Set_Field (Object : in out Image_Ref'Class;
                        Impl   : out Image_Access) is
      Result : ADO.Objects.Object_Record_Access;
   begin
      Object.Prepare_Modify (Result);
      Impl := Image_Impl (Result.all)'Access;
   end Set_Field;

   --  Internal method to allocate the Object_Record instance
   procedure Allocate (Object : in out Image_Ref) is
      Impl : Image_Access;
   begin
      Impl := new Image_Impl;
      Impl.Version := 0;
      Impl.Create_Date := ADO.DEFAULT_TIME;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Allocate;

   -- ----------------------------------------
   --  Data object: Image
   -- ----------------------------------------

   procedure Set_Id (Object : in out Image_Ref;
                     Value  : in ADO.Identifier) is
      Impl : Image_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Key_Value (Impl.all, 1, Value);
   end Set_Id;

   function Get_Id (Object : in Image_Ref)
                  return ADO.Identifier is
      Impl : constant Image_Access
         := Image_Impl (Object.Get_Object.all)'Access;
   begin
      return Impl.Get_Key_Value;
   end Get_Id;


   function Get_Version (Object : in Image_Ref)
                  return Integer is
      Impl : constant Image_Access
         := Image_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Version;
   end Get_Version;


   procedure Set_Create_Date (Object : in out Image_Ref;
                              Value  : in Ada.Calendar.Time) is
      Impl : Image_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Time (Impl.all, 3, Impl.Create_Date, Value);
   end Set_Create_Date;

   function Get_Create_Date (Object : in Image_Ref)
                  return Ada.Calendar.Time is
      Impl : constant Image_Access
         := Image_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Create_Date;
   end Get_Create_Date;


   procedure Set_Image (Object : in out Image_Ref;
                        Value  : in ADO.Blob_Ref) is
      Impl : Image_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Blob (Impl.all, 4, Impl.Image, Value);
   end Set_Image;

   function Get_Image (Object : in Image_Ref)
                  return ADO.Blob_Ref is
      Impl : constant Image_Access
         := Image_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Image;
   end Get_Image;

   --  Copy of the object.
   procedure Copy (Object : in Image_Ref;
                   Into   : in out Image_Ref) is
      Result : Image_Ref;
   begin
      if not Object.Is_Null then
         declare
            Impl : constant Image_Access
              := Image_Impl (Object.Get_Load_Object.all)'Access;
            Copy : constant Image_Access
              := new Image_Impl;
         begin
            ADO.Objects.Set_Object (Result, Copy.all'Access);
            Copy.Copy (Impl.all);
            Copy.Version := Impl.Version;
            Copy.Create_Date := Impl.Create_Date;
            Copy.Image := Impl.Image;
         end;
      end if;
      Into := Result;
   end Copy;

   procedure Find (Object  : in out Image_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Impl  : constant Image_Access := new Image_Impl;
   begin
      Impl.Find (Session, Query, Found);
      if Found then
         ADO.Objects.Set_Object (Object, Impl.all'Access);
      else
         ADO.Objects.Set_Object (Object, null);
         Destroy (Impl);
      end if;
   end Find;

   procedure Load (Object  : in out Image_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier) is
      Impl  : constant Image_Access := new Image_Impl;
      Found : Boolean;
      Query : ADO.SQL.Query;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Impl.Find (Session, Query, Found);
      if not Found then
         Destroy (Impl);
         raise ADO.Objects.NOT_FOUND;
      end if;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Load;

   procedure Load (Object  : in out Image_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean) is
      Impl  : constant Image_Access := new Image_Impl;
      Query : ADO.SQL.Query;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Impl.Find (Session, Query, Found);
      if not Found then
         Destroy (Impl);
      else
         ADO.Objects.Set_Object (Object, Impl.all'Access);
      end if;
   end Load;

   procedure Save (Object  : in out Image_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl = null then
         Impl := new Image_Impl;
         ADO.Objects.Set_Object (Object, Impl);
      end if;
      if not ADO.Objects.Is_Created (Impl.all) then
         Impl.Create (Session);
      else
         Impl.Save (Session);
      end if;
   end Save;

   procedure Delete (Object  : in out Image_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : constant ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl /= null then
         Impl.Delete (Session);
      end if;
   end Delete;

   --  --------------------
   --  Free the object
   --  --------------------
   procedure Destroy (Object : access Image_Impl) is
      type Image_Impl_Ptr is access all Image_Impl;
      procedure Unchecked_Free is new Ada.Unchecked_Deallocation
              (Image_Impl, Image_Impl_Ptr);
      pragma Warnings (Off, "*redundant conversion*");
      Ptr : Image_Impl_Ptr := Image_Impl (Object.all)'Access;
      pragma Warnings (On, "*redundant conversion*");
   begin
      Unchecked_Free (Ptr);
   end Destroy;

   procedure Find (Object  : in out Image_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Stmt : ADO.Statements.Query_Statement
          := Session.Create_Statement (Query, IMAGE_DEF'Access);
   begin
      Stmt.Execute;
      if Stmt.Has_Elements then
         Object.Load (Stmt, Session);
         Stmt.Next;
         Found := not Stmt.Has_Elements;
      else
         Found := False;
      end if;
   end Find;

   overriding
   procedure Load (Object  : in out Image_Impl;
                   Session : in out ADO.Sessions.Session'Class) is
      Found : Boolean;
      Query : ADO.SQL.Query;
      Id    : constant ADO.Identifier := Object.Get_Key_Value;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Object.Find (Session, Query, Found);
      if not Found then
         raise ADO.Objects.NOT_FOUND;
      end if;
   end Load;

   procedure Save (Object  : in out Image_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Update_Statement
         := Session.Create_Statement (IMAGE_DEF'Access);
   begin
      if Object.Is_Modified (1) then
         Stmt.Save_Field (Name  => COL_0_1_NAME, --  id
                          Value => Object.Get_Key);
         Object.Clear_Modified (1);
      end if;
      if Object.Is_Modified (4) then
         Stmt.Save_Field (Name  => COL_3_1_NAME, --  image
                          Value => Object.Image);
         Object.Clear_Modified (4);
      end if;
      if Stmt.Has_Save_Fields then
         Object.Version := Object.Version + 1;
         Stmt.Save_Field (Name  => "version",
                          Value => Object.Version);
         Stmt.Set_Filter (Filter => "id = ? and version = ?");
         Stmt.Add_Param (Value => Object.Get_Key);
         Stmt.Add_Param (Value => Object.Version - 1);
         declare
            Result : Integer;
         begin
            Stmt.Execute (Result);
            if Result /= 1 then
               if Result /= 0 then
                  raise ADO.Objects.UPDATE_ERROR;
               else
                  raise ADO.Objects.LAZY_LOCK;
               end if;
            end if;
         end;
      end if;
   end Save;

   procedure Create (Object  : in out Image_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Query : ADO.Statements.Insert_Statement
                  := Session.Create_Statement (IMAGE_DEF'Access);
      Result : Integer;
   begin
      Object.Version := 1;
      Session.Allocate (Id => Object);
      Query.Save_Field (Name  => COL_0_1_NAME, --  id
                        Value => Object.Get_Key);
      Query.Save_Field (Name  => COL_1_1_NAME, --  version
                        Value => Object.Version);
      Query.Save_Field (Name  => COL_2_1_NAME, --  create_date
                        Value => Object.Create_Date);
      Query.Save_Field (Name  => COL_3_1_NAME, --  image
                        Value => Object.Image);
      Query.Execute (Result);
      if Result /= 1 then
         raise ADO.Objects.INSERT_ERROR;
      end if;
      ADO.Objects.Set_Created (Object);
   end Create;

   procedure Delete (Object  : in out Image_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Delete_Statement
         := Session.Create_Statement (IMAGE_DEF'Access);
   begin
      Stmt.Set_Filter (Filter => "id = ?");
      Stmt.Add_Param (Value => Object.Get_Key);
      Stmt.Execute;
   end Delete;

   --  ------------------------------
   --  Get the bean attribute identified by the name.
   --  ------------------------------
   overriding
   function Get_Value (From : in Image_Ref;
                       Name : in String) return Util.Beans.Objects.Object is
      Obj  : ADO.Objects.Object_Record_Access;
      Impl : access Image_Impl;
   begin
      if From.Is_Null then
         return Util.Beans.Objects.Null_Object;
      end if;
      Obj := From.Get_Load_Object;
      Impl := Image_Impl (Obj.all)'Access;
      if Name = "id" then
         return ADO.Objects.To_Object (Impl.Get_Key);
      elsif Name = "create_date" then
         return Util.Beans.Objects.Time.To_Object (Impl.Create_Date);
      end if;
      return Util.Beans.Objects.Null_Object;
   end Get_Value;


   procedure List (Object  : in out Image_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class) is
      Stmt : ADO.Statements.Query_Statement
        := Session.Create_Statement (Query, IMAGE_DEF'Access);
   begin
      Stmt.Execute;
      Image_Vectors.Clear (Object);
      while Stmt.Has_Elements loop
         declare
            Item : Image_Ref;
            Impl : constant Image_Access := new Image_Impl;
         begin
            Impl.Load (Stmt, Session);
            ADO.Objects.Set_Object (Item, Impl.all'Access);
            Object.Append (Item);
         end;
         Stmt.Next;
      end loop;
   end List;

   --  ------------------------------
   --  Load the object from current iterator position
   --  ------------------------------
   procedure Load (Object  : in out Image_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class) is
      pragma Unreferenced (Session);
   begin
      Object.Set_Key_Value (Stmt.Get_Identifier (0));
      Object.Create_Date := Stmt.Get_Time (2);
      Object.Image := Stmt.Get_Blob (3);
      Object.Version := Stmt.Get_Integer (1);
      ADO.Objects.Set_Created (Object);
   end Load;


end Regtests.Images.Model;
