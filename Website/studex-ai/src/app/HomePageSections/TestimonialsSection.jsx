import React from 'react'

const TestimonialsSection = () => {
  return (
    <section
      id='testimonials'
      className='bg-gradient-to-b from-white to-gray-50 py-20 dark:from-neutral-900 dark:to-neutral-800'
    >
      <div className='container mx-auto px-4'>
        <div className='mx-auto mb-16 max-w-3xl text-center'>
          <span className='inline-block rounded-full bg-pink-100 px-3 py-1 text-sm font-semibold text-pink-800 dark:bg-pink-900/30 dark:text-pink-300'>
            Success Stories
          </span>
          <h2 className='animate__animated animate__fadeIn mt-4 text-3xl font-bold leading-tight text-gray-900 dark:text-white sm:text-4xl lg:text-5xl'>
            What Our Users Say
          </h2>
          <p className='mt-4 text-xl text-gray-600 dark:text-gray-300'>
            Discover how our app has transformed students' learning experiences
          </p>
        </div>

        <div className='animate__animated animate__fadeIn mx-auto mb-20 max-w-5xl overflow-hidden rounded-2xl bg-gradient-to-r from-indigo-600 to-purple-600 shadow-xl dark:from-indigo-700 dark:to-purple-700'>
          <div className='grid md:grid-cols-5'>
            <div className='flex items-center justify-center bg-indigo-700 p-6 md:col-span-2'>
              <div className='relative h-72 w-72 overflow-hidden rounded-full border-4 border-indigo-300 bg-indigo-200 dark:border-indigo-500 dark:bg-indigo-800'>
                <div className='absolute inset-0 flex items-center justify-center'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-40 w-40 text-indigo-400 dark:text-indigo-600'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path
                      fill-rule='evenodd'
                      d='M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-6-3a2 2 0 11-4 0 2 2 0 014 0zm-2 4a5 5 0 00-4.546 2.916A5.986 5.986 0 0010 16a5.986 5.986 0 004.546-2.084A5 5 0 0010 11z'
                      clip-rule='evenodd'
                    ></path>
                  </svg>
                </div>
              </div>
            </div>

            <div className='p-8 text-white md:col-span-3'>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-10 w-10 text-indigo-300 opacity-50'
                fill='none'
                viewBox='0 0 24 24'
                stroke='currentColor'
                data-darkreader-inline-stroke=''
                styles='--darkreader-inline-stroke: currentColor;'
              >
                <path
                  stroke-linecap='round'
                  stroke-linejoin='round'
                  stroke-width='2'
                  d='M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z'
                ></path>
              </svg>

              <p className='mt-6 text-xl font-medium italic leading-relaxed text-white'>
                "This app completely transformed my study habits. The
                personalized exams and ability to connect with peers for help
                has improved my grades significantly. I went from struggling in
                mathematics to scoring in the top 10% of my class!"
              </p>

              <div className='mt-10 flex items-center'>
                <div className='flex-shrink-0'>
                  <div className='flex h-12 w-12 items-center justify-center rounded-full bg-white text-indigo-700'>
                    <span className='text-lg font-bold'>AP</span>
                  </div>
                </div>
                <div className='ml-4'>
                  <h4 className='text-lg font-bold'>Aarav Patel</h4>
                  <div className='text-indigo-200'>
                    Grade 11 • Mathematics • Delhi
                  </div>
                  <div className='mt-2 flex'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5 text-yellow-300'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                    </svg>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5 text-yellow-300'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                    </svg>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5 text-yellow-300'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                    </svg>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5 text-yellow-300'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                    </svg>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5 text-yellow-300'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                    </svg>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className='mx-auto grid max-w-6xl gap-8 md:grid-cols-2 lg:grid-cols-3'>
          <div className='animate__animated animate__fadeInUp group rounded-xl bg-white p-6 shadow-lg transition-all duration-300 hover:-translate-y-1 hover:shadow-xl dark:bg-neutral-800'>
            <div className='mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-rose-100 text-rose-600 transition-transform duration-300 group-hover:scale-110 dark:bg-rose-900/30 dark:text-rose-400'>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-6 w-6'
                fill='none'
                viewBox='0 0 24 24'
                stroke='currentColor'
                data-darkreader-inline-stroke=''
                styles='--darkreader-inline-stroke: currentColor;'
              >
                <path
                  stroke-linecap='round'
                  stroke-linejoin='round'
                  stroke-width='2'
                  d='M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z'
                ></path>
              </svg>
            </div>

            <div className='mb-4 flex space-x-1 text-yellow-400'>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
              </svg>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
              </svg>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
              </svg>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
              </svg>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
              </svg>
            </div>

            <p className='mb-6 italic text-gray-600 dark:text-gray-300'>
              "The ability to create custom exams is a game-changer! I can focus
              on topics I find challenging and track my improvement. My science
              grades have improved from C to A- in just two months!"
            </p>

            <div className='flex items-center border-t border-gray-100 pt-4 dark:border-gray-700'>
              <div className='flex h-10 w-10 items-center justify-center rounded-full bg-pink-100 text-pink-700 dark:bg-pink-900/30 dark:text-pink-400'>
                <span className='text-sm font-semibold'>SM</span>
              </div>
              <div className='ml-3'>
                <h5 className='text-base font-semibold text-gray-900 dark:text-white'>
                  Sophia Martinez
                </h5>
                <p className='text-sm text-gray-500 dark:text-gray-400'>
                  Grade 9 • Science
                </p>
              </div>
            </div>
          </div>

          <div className='animate__animated animate__fadeInUp animate__delay-1s group rounded-xl bg-white p-6 shadow-lg transition-all duration-300 hover:-translate-y-1 hover:shadow-xl dark:bg-neutral-800'>
            <div className='mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-green-100 text-green-600 transition-transform duration-300 group-hover:scale-110 dark:bg-green-900/30 dark:text-green-400'>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-6 w-6'
                fill='none'
                viewBox='0 0 24 24'
                stroke='currentColor'
                data-darkreader-inline-stroke=''
                styles='--darkreader-inline-stroke: currentColor;'
              >
                <path
                  stroke-linecap='round'
                  stroke-linejoin='round'
                  stroke-width='2'
                  d='M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z'
                ></path>
              </svg>
            </div>

            <div className='mb-4 flex space-x-1 text-yellow-400'>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
              </svg>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
              </svg>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
              </svg>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
              </svg>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
              </svg>
            </div>

            <p className='mb-6 italic text-gray-600 dark:text-gray-300'>
              "As a parent, I'm impressed with how this app has motivated my son
              to study. The challenge feature makes learning competitive and
              fun. He's now excited about math instead of dreading it!"
            </p>

            <div className='flex items-center border-t border-gray-100 pt-4 dark:border-gray-700'>
              <div className='flex h-10 w-10 items-center justify-center rounded-full bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400'>
                <span className='text-sm font-semibold'>AS</span>
              </div>
              <div className='ml-3'>
                <h5 className='text-base font-semibold text-gray-900 dark:text-white'>
                  Anjali Sharma
                </h5>
                <p className='text-sm text-gray-500 dark:text-gray-400'>
                  Parent • Grade 8 Student
                </p>
              </div>
            </div>
          </div>

          <div className='animate__animated animate__fadeInUp animate__delay-2s group rounded-xl bg-white p-6 shadow-lg transition-all duration-300 hover:-translate-y-1 hover:shadow-xl dark:bg-neutral-800'>
            <div className='mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-blue-100 text-blue-600 transition-transform duration-300 group-hover:scale-110 dark:bg-blue-900/30 dark:text-blue-400'>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-6 w-6'
                fill='none'
                viewBox='0 0 24 24'
                stroke='currentColor'
                data-darkreader-inline-stroke=''
                styles='--darkreader-inline-stroke: currentColor;'
              >
                <path
                  stroke-linecap='round'
                  stroke-linejoin='round'
                  stroke-width='2'
                  d='M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z'
                ></path>
              </svg>
            </div>

            <div className='mb-4 flex space-x-1 text-yellow-400'>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
              </svg>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
              </svg>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
              </svg>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
              </svg>
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
              </svg>
            </div>

            <p className='mb-6 italic text-gray-600 dark:text-gray-300'>
              "The community aspect of this app is phenomenal. When I get stuck,
              I can post my questions and get help from other students quickly.
              The collaborative learning environment has made such a
              difference."
            </p>

            <div className='flex items-center border-t border-gray-100 pt-4 dark:border-gray-700'>
              <div className='flex h-10 w-10 items-center justify-center rounded-full bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400'>
                <span className='text-sm font-semibold'>JW</span>
              </div>
              <div className='ml-3'>
                <h5 className='text-base font-semibold text-gray-900 dark:text-white'>
                  Jason Wong
                </h5>
                <p className='text-sm text-gray-500 dark:text-gray-400'>
                  Grade 12 • Multiple Subjects
                </p>
              </div>
            </div>
          </div>

          <div className='animate__animated animate__fadeInUp group rounded-xl bg-white p-6 shadow-lg transition-all duration-300 hover:-translate-y-1 hover:shadow-xl dark:bg-neutral-800 md:col-span-1 lg:col-span-3'>
            <div className='md:grid md:grid-cols-3 md:gap-10'>
              <div className='mb-6 flex justify-center md:col-span-1 md:mb-0'>
                <div className='flex h-32 w-32 items-center justify-center overflow-hidden rounded-full border-4 border-amber-200 bg-amber-100 dark:border-amber-900/50 dark:bg-amber-900/30'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-16 w-16 text-amber-600 dark:text-amber-500'
                    fill='none'
                    viewBox='0 0 24 24'
                    stroke='currentColor'
                    data-darkreader-inline-stroke=''
                    styles='--darkreader-inline-stroke: currentColor;'
                  >
                    <path
                      stroke-linecap='round'
                      stroke-linejoin='round'
                      stroke-width='2'
                      d='M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z'
                    ></path>
                  </svg>
                </div>
              </div>
              <div className='md:col-span-2'>
                <div className='mb-4 flex space-x-1 text-yellow-400'>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                  <svg
                    xmlns='http://www.w3.org/2000/svg'
                    className='h-5 w-5'
                    viewBox='0 0 20 20'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  >
                    <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                  </svg>
                </div>

                <p className='mb-6 text-lg italic text-gray-600 dark:text-gray-300'>
                  "As a teacher, I recommend this app to all my students. It's
                  been revolutionary in my classroom. The ability to create
                  custom exams aligned with our curriculum saves me time, and
                  students love the interactive format. I've seen a significant
                  increase in engagement and performance since we started using
                  it. The analytics feature also helps me identify which
                  concepts need additional attention."
                </p>

                <div className='flex items-center'>
                  <div className='flex h-10 w-10 items-center justify-center rounded-full bg-amber-100 text-amber-700 dark:bg-amber-900/30 dark:text-amber-400'>
                    <span className='text-sm font-semibold'>RJ</span>
                  </div>
                  <div className='ml-3'>
                    <h5 className='text-base font-semibold text-gray-900 dark:text-white'>
                      Mr. Raj Joshi
                    </h5>
                    <p className='text-sm text-gray-500 dark:text-gray-400'>
                      High School Science Teacher • 15 years experience
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className='mx-auto mt-20 max-w-6xl rounded-2xl bg-gradient-to-r from-indigo-600 to-purple-600 p-8 text-white shadow-xl dark:from-indigo-700 dark:to-purple-700'>
          <div className='grid gap-8 md:grid-cols-4'>
            <div className='text-center'>
              <div className='text-4xl font-extrabold'>250k+</div>
              <div className='mt-2 text-indigo-100'>Active Students</div>
            </div>
            <div className='text-center'>
              <div className='text-4xl font-extrabold'>95%</div>
              <div className='mt-2 text-indigo-100'>Satisfaction Rate</div>
            </div>
            <div className='text-center'>
              <div className='text-4xl font-extrabold'>78%</div>
              <div className='mt-2 text-indigo-100'>Grade Improvement</div>
            </div>
            <div className='text-center'>
              <div className='text-4xl font-extrabold'>5M+</div>
              <div className='mt-2 text-indigo-100'>Exams Completed</div>
            </div>
          </div>
        </div>

        <div className='mx-auto mt-20 max-w-6xl'>
          <h3 className='mb-10 text-center text-2xl font-bold text-gray-900 dark:text-white'>
            Watch Student Stories
          </h3>

          <div className='grid gap-8 md:grid-cols-3'>
            <div className='group overflow-hidden rounded-xl bg-white shadow-lg transition-all duration-300 hover:-translate-y-1 hover:shadow-xl dark:bg-neutral-800'>
              <div className='relative aspect-w-16 aspect-h-9 overflow-hidden rounded-t-xl bg-gray-200 dark:bg-gray-700'>
                <div className='absolute inset-0 flex items-center justify-center'>
                  <div className='flex h-16 w-16 items-center justify-center rounded-full bg-indigo-600/90 text-white transition-transform duration-300 group-hover:scale-110'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-8 w-8'
                      fill='none'
                      viewBox='0 0 24 24'
                      stroke='currentColor'
                      data-darkreader-inline-stroke=''
                      styles='--darkreader-inline-stroke: currentColor;'
                    >
                      <path
                        stroke-linecap='round'
                        stroke-linejoin='round'
                        stroke-width='2'
                        d='M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z'
                      ></path>
                      <path
                        stroke-linecap='round'
                        stroke-linejoin='round'
                        stroke-width='2'
                        d='M21 12a9 9 0 11-18 0 9 9 0 0118 0z'
                      ></path>
                    </svg>
                  </div>
                </div>
              </div>
              <div className='p-4'>
                <h4 className='text-lg font-semibold text-gray-900 dark:text-white'>
                  Rohan's Journey from C to A+
                </h4>
                <p className='mt-2 text-sm text-gray-600 dark:text-gray-400'>
                  See how Rohan improved his math grades with consistent
                  practice on our app.
                </p>
              </div>
            </div>

            <div className='group overflow-hidden rounded-xl bg-white shadow-lg transition-all duration-300 hover:-translate-y-1 hover:shadow-xl dark:bg-neutral-800'>
              <div className='relative aspect-w-16 aspect-h-9 overflow-hidden rounded-t-xl bg-gray-200 dark:bg-gray-700'>
                <div className='absolute inset-0 flex items-center justify-center'>
                  <div className='flex h-16 w-16 items-center justify-center rounded-full bg-indigo-600/90 text-white transition-transform duration-300 group-hover:scale-110'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-8 w-8'
                      fill='none'
                      viewBox='0 0 24 24'
                      stroke='currentColor'
                      data-darkreader-inline-stroke=''
                      styles='--darkreader-inline-stroke: currentColor;'
                    >
                      <path
                        stroke-linecap='round'
                        stroke-linejoin='round'
                        stroke-width='2'
                        d='M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z'
                      ></path>
                      <path
                        stroke-linecap='round'
                        stroke-linejoin='round'
                        stroke-width='2'
                        d='M21 12a9 9 0 11-18 0 9 9 0 0118 0z'
                      ></path>
                    </svg>
                  </div>
                </div>
              </div>
              <div className='p-4'>
                <h4 className='text-lg font-semibold text-gray-900 dark:text-white'>
                  Priya's Success Story
                </h4>
                <p className='mt-2 text-sm text-gray-600 dark:text-gray-400'>
                  How Priya aced her science exams using our custom test
                  creation tools.
                </p>
              </div>
            </div>

            <div className='group overflow-hidden rounded-xl bg-white shadow-lg transition-all duration-300 hover:-translate-y-1 hover:shadow-xl dark:bg-neutral-800'>
              <div className='relative aspect-w-16 aspect-h-9 overflow-hidden rounded-t-xl bg-gray-200 dark:bg-gray-700'>
                <div className='absolute inset-0 flex items-center justify-center'>
                  <div className='flex h-16 w-16 items-center justify-center rounded-full bg-indigo-600/90 text-white transition-transform duration-300 group-hover:scale-110'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-8 w-8'
                      fill='none'
                      viewBox='0 0 24 24'
                      stroke='currentColor'
                      data-darkreader-inline-stroke=''
                      styles='--darkreader-inline-stroke: currentColor;'
                    >
                      <path
                        stroke-linecap='round'
                        stroke-linejoin='round'
                        stroke-width='2'
                        d='M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z'
                      ></path>
                      <path
                        stroke-linecap='round'
                        stroke-linejoin='round'
                        stroke-width='2'
                        d='M21 12a9 9 0 11-18 0 9 9 0 0118 0z'
                      ></path>
                    </svg>
                  </div>
                </div>
              </div>
              <div className='p-4'>
                <h4 className='text-lg font-semibold text-gray-900 dark:text-white'>
                  Teacher Testimonial: Mrs. Gupta
                </h4>
                <p className='mt-2 text-sm text-gray-600 dark:text-gray-400'>
                  A veteran teacher explains how our app transformed her
                  classroom dynamics.
                </p>
              </div>
            </div>
          </div>
        </div>

        <div className='mx-auto mt-20 max-w-2xl rounded-2xl bg-white p-8 text-center shadow-xl dark:bg-neutral-800'>
          <h3 className='text-2xl font-bold text-gray-900 dark:text-white'>
            Join Thousands of Successful Students
          </h3>
          <p className='mt-4 text-lg text-gray-600 dark:text-gray-300'>
            Experience the platform that's helping students achieve academic
            excellence
          </p>
          <div className='mt-8'>
            <a
              href='#download'
              className='animate__animated animate__pulse animate__infinite animate__slow inline-flex items-center rounded-lg bg-gradient-to-r from-indigo-600 to-purple-600 px-6 py-3 text-base font-medium text-white shadow-lg transition-transform hover:-translate-y-1 hover:shadow-xl dark:from-indigo-700 dark:to-purple-700'
            >
              Download the App
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='ml-2 h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path
                  fill-rule='evenodd'
                  d='M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z'
                  clip-rule='evenodd'
                ></path>
              </svg>
            </a>
          </div>
        </div>
      </div>
    </section>
  )
}

export default TestimonialsSection
